import nodemailer from 'nodemailer';
import { NextRequest, NextResponse } from 'next/server';
import { contactFormSchema } from '@/lib/contact';

const WINDOW_MS = 10 * 60 * 1000;
const MAX_ATTEMPTS_PER_WINDOW = 5;

type RateLimitEntry = {
  count: number;
  resetAt: number;
};

const rateLimitStore = new Map<string, RateLimitEntry>();

function getClientIp(req: NextRequest): string {
  const forwarded = req.headers.get('x-forwarded-for');
  if (forwarded) {
    return forwarded.split(',')[0]?.trim() || 'unknown';
  }

  return req.headers.get('x-real-ip') || 'unknown';
}

function checkRateLimit(key: string): { limited: boolean; retryAfter: number } {
  const now = Date.now();
  const current = rateLimitStore.get(key);

  if (!current || now > current.resetAt) {
    rateLimitStore.set(key, { count: 1, resetAt: now + WINDOW_MS });
    return { limited: false, retryAfter: 0 };
  }

  if (current.count >= MAX_ATTEMPTS_PER_WINDOW) {
    return { limited: true, retryAfter: Math.ceil((current.resetAt - now) / 1000) };
  }

  current.count += 1;
  rateLimitStore.set(key, current);
  return { limited: false, retryAfter: 0 };
}

function escapeHtml(value: string): string {
  return value
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/\"/g, '&quot;')
    .replace(/'/g, '&#39;');
}

export async function POST(req: NextRequest) {
  try {
    const ip = getClientIp(req);
    const rateLimit = checkRateLimit(ip);

    if (rateLimit.limited) {
      return NextResponse.json(
        { error: 'Too many requests. Please try again shortly.' },
        {
          status: 429,
          headers: {
            'Retry-After': String(rateLimit.retryAfter),
            'Cache-Control': 'no-store',
          },
        },
      );
    }

    const body = await req.json();
    const parsed = contactFormSchema.safeParse(body);

    if (!parsed.success) {
      return NextResponse.json(
        {
          error: parsed.error.issues[0]?.message || 'Invalid form input',
        },
        { status: 400, headers: { 'Cache-Control': 'no-store' } },
      );
    }

    const { email, subject, message, website } = parsed.data;

    if (website) {
      return NextResponse.json({ ok: true }, { status: 200, headers: { 'Cache-Control': 'no-store' } });
    }

    const user = process.env.EMAIL_FROM;
    const pass = process.env.GMAIL_APP_PASSWORD;
    const to = process.env.EMAIL_TO || user;

    if (!user || !pass) {
      console.error('send-email: missing EMAIL_FROM or GMAIL_APP_PASSWORD');
      return NextResponse.json(
        { error: 'Service unavailable right now. Please use the direct links below.' },
        { status: 503, headers: { 'Cache-Control': 'no-store' } },
      );
    }

    const transporter = nodemailer.createTransport({
      host: 'smtp.gmail.com',
      port: 465,
      secure: true,
      auth: {
        user,
        pass,
      },
    });

    const safeMessage = escapeHtml(message).replace(/\n/g, '<br/>');
    const safeEmail = escapeHtml(email);

    await transporter.sendMail({
      from: user,
      to,
      subject: `[Portfolio] ${subject}`,
      replyTo: email,
      text: `${message}\n\nReply to: ${email}`,
      html: `<p>${safeMessage}</p><hr/><p><strong>Reply to:</strong> ${safeEmail}</p><p><strong>Sender IP:</strong> ${escapeHtml(ip)}</p>`,
    });

    return NextResponse.json({ ok: true }, { status: 200, headers: { 'Cache-Control': 'no-store' } });
  } catch (error) {
    console.error('send-email error', error);
    return NextResponse.json(
      { error: 'Unable to send message right now. Please try again.' },
      { status: 500, headers: { 'Cache-Control': 'no-store' } },
    );
  }
}
