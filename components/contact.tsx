"use client";

import { useState } from 'react';
import { contactFormSchema, CONTACT_LINKS } from '@/lib/contact';

export default function Contact() {
  const [email, setEmail] = useState('');
  const [subject, setSubject] = useState('');
  const [message, setMessage] = useState('');
  const [website, setWebsite] = useState('');
  const [loading, setLoading] = useState(false);
  const [status, setStatus] = useState<'idle'|'sending'|'success'|'error'>('idle');
  const [errorMessage, setErrorMessage] = useState('');

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setErrorMessage('');

    const parsed = contactFormSchema.safeParse({ email, subject, message, website });

    if (!parsed.success) {
      setStatus('error');
      setErrorMessage(parsed.error.issues[0]?.message || 'Please check your input and try again.');
      return;
    }

    setLoading(true);
    setStatus('sending');

    const controller = new AbortController();
    const timeout = setTimeout(() => controller.abort(), 10000);

    try {
      const res = await fetch('/api/send-email', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(parsed.data),
        signal: controller.signal,
      });

      const payload = await res.json().catch(() => ({}));

      if (res.ok) {
        setStatus('success');
        setEmail('');
        setSubject('');
        setMessage('');
        setWebsite('');
      } else {
        setStatus('error');
        setErrorMessage(payload?.error || 'Failed to send message. Please try again.');
      }
    } catch {
      setStatus('error');
      setErrorMessage('Network issue. Please retry, or use email/phone links below.');
    } finally {
      clearTimeout(timeout);
      setLoading(false);
    }
  };

  return (
    <section className="space-y-8">
      <h2 className="text-3xl lg:text-4xl font-bold text-foreground mb-8">Get in Touch</h2>
      
      <div className="space-y-8">
        <div className="prose max-w-none">
          <p className="text-lg text-foreground leading-relaxed mb-6">
            I&apos;m always interested in hearing about new projects and opportunities. Whether you have a question or just want to say hello, feel free to reach out!
          </p>
        </div>

        <form onSubmit={handleSubmit} className="grid gap-4" noValidate>
          <input
            type="text"
            name="website"
            value={website}
            onChange={(e) => setWebsite(e.target.value)}
            autoComplete="off"
            tabIndex={-1}
            className="hidden"
            aria-hidden="true"
          />

          <div className="grid gap-2 sm:grid-cols-2">
            <label className="flex flex-col">
              <span className="text-sm font-medium text-muted-foreground">Your email</span>
              <input
                required
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                type="email"
                autoComplete="email"
                maxLength={120}
                className="mt-1 rounded-md border border-border px-3 py-2"
                placeholder="you@example.com"
              />
            </label>
            <label className="flex flex-col">
              <span className="text-sm font-medium text-muted-foreground">Subject</span>
              <input
                required
                value={subject}
                onChange={(e) => setSubject(e.target.value)}
                type="text"
                autoComplete="off"
                maxLength={120}
                className="mt-1 rounded-md border border-border px-3 py-2"
                placeholder="Project enquiry"
              />
            </label>
          </div>

          <label className="flex flex-col">
            <span className="text-sm font-medium text-muted-foreground">Message</span>
            <textarea
              required
              value={message}
              onChange={(e) => setMessage(e.target.value)}
              rows={6}
              minLength={10}
              maxLength={4000}
              className="mt-1 rounded-md border border-border px-3 py-2"
              placeholder="Tell me about your project..."
            />
          </label>

          <div className="flex flex-wrap items-center gap-3" aria-live="polite">
            <button
              disabled={loading}
              type="submit"
              title="Send your message"
              className="rounded-full bg-accent px-6 py-2 text-sm font-semibold text-accent-foreground"
            >
              {loading ? 'Sending...' : 'Send message'}
            </button>
            {status === 'success' && <span className="text-sm text-green-600">Message sent — thanks!</span>}
            {status === 'error' && <span className="text-sm text-destructive">{errorMessage || 'Failed to send. Please try again.'}</span>}
          </div>
        </form>

        <div className="flex flex-col sm:flex-row gap-4">
          <a
            href={`mailto:${CONTACT_LINKS.email}`}
            title="Open your email app"
            className="inline-flex items-center justify-center gap-3 rounded-full bg-accent px-6 py-3 text-sm font-semibold text-accent-foreground transition-colors hover:bg-accent/90"
          >
            <svg className="h-4 w-4" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
              <path d="M20 4H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z" />
            </svg>
            Send me an email
          </a>

          <a
            href={`tel:${CONTACT_LINKS.phoneHref}`}
            title="Call directly"
            className="inline-flex items-center justify-center gap-3 rounded-full border border-border bg-background px-6 py-3 text-sm font-semibold text-foreground transition-colors hover:border-accent hover:text-accent"
          >
            <svg className="h-4 w-4" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
              <path d="M17 10.5V7c0-.55-.45-1-1-1H4c-.55 0-1 .45-1 1v10c0 .55.45 1 1 1h12c.55 0 1-.45 1-1v-3.5l4 4v-11l-4 4z" />
            </svg>
            Call me directly
          </a>

          <a
            href={CONTACT_LINKS.whatsapp}
            target="_blank"
            rel="noopener noreferrer"
            title="Chat on WhatsApp"
            className="inline-flex items-center justify-center gap-3 rounded-full border border-border bg-background px-6 py-3 text-sm font-semibold text-foreground transition-colors hover:border-accent hover:text-accent"
          >
            <svg className="h-4 w-4" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
              <path d="M20.52 3.48A11.86 11.86 0 0012.07.02C5.54.02.22 5.34.22 11.87c0 2.09.55 4.13 1.59 5.94L0 24l6.35-1.66a11.8 11.8 0 005.72 1.46h.01c6.53 0 11.85-5.32 11.86-11.85a11.79 11.79 0 00-3.42-8.47zm-8.45 18.3h-.01a9.84 9.84 0 01-5.01-1.38l-.36-.21-3.77.99 1-3.67-.24-.38a9.84 9.84 0 01-1.52-5.27c0-5.44 4.43-9.87 9.88-9.87 2.64 0 5.12 1.03 6.99 2.9a9.82 9.82 0 012.89 6.99c0 5.45-4.43 9.88-9.85 9.88zm5.41-7.38c-.3-.15-1.77-.88-2.05-.98-.27-.1-.47-.15-.66.15-.2.3-.77.97-.94 1.17-.17.2-.35.22-.65.07-.3-.15-1.28-.47-2.44-1.5-.9-.8-1.5-1.78-1.68-2.08-.18-.3-.02-.46.14-.6.14-.14.3-.35.45-.52.15-.18.2-.3.3-.5.1-.2.05-.37-.02-.52-.08-.15-.67-1.62-.92-2.22-.24-.57-.48-.49-.66-.5h-.56c-.2 0-.52.07-.8.37-.27.3-1.05 1.02-1.05 2.49 0 1.47 1.08 2.9 1.23 3.1.15.2 2.12 3.24 5.14 4.55.72.3 1.28.49 1.72.63.72.23 1.37.2 1.89.12.58-.08 1.77-.72 2.02-1.41.25-.7.25-1.29.17-1.41-.08-.12-.28-.2-.58-.35z" />
            </svg>
            WhatsApp
          </a>
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-2 gap-6">
          <a
            href={`mailto:${CONTACT_LINKS.email}`}
            title="Email Syed Isbah"
            className="bg-white border border-border rounded-lg p-6 hover:border-accent transition-colors group shadow-sm"
          >
            <div className="flex items-center gap-3 mb-2">
              <svg className="w-5 h-5 text-accent" fill="currentColor" viewBox="0 0 24 24">
                <path d="M20 4H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z" />
              </svg>
              <h3 className="font-semibold text-foreground group-hover:text-accent transition-colors">Email</h3>
            </div>
            <p className="text-muted-foreground text-sm">{CONTACT_LINKS.email}</p>
          </a>

          <a
            href={`tel:${CONTACT_LINKS.phoneHref}`}
            title="Call Syed Isbah"
            className="bg-white border border-border rounded-lg p-6 hover:border-accent transition-colors group shadow-sm"
          >
            <div className="flex items-center gap-3 mb-2">
              <svg className="w-5 h-5 text-accent" fill="currentColor" viewBox="0 0 24 24">
                <path d="M17 10.5V7c0-.55-.45-1-1-1H4c-.55 0-1 .45-1 1v10c0 .55.45 1 1 1h12c.55 0 1-.45 1-1v-3.5l4 4v-11l-4 4z" />
              </svg>
              <h3 className="font-semibold text-foreground group-hover:text-accent transition-colors">Phone</h3>
            </div>
            <p className="text-muted-foreground text-sm">{CONTACT_LINKS.phoneDisplay}</p>
          </a>

          <a
            href={CONTACT_LINKS.linkedin}
            target="_blank"
            rel="noopener noreferrer"
            title="Open LinkedIn profile"
            className="bg-white border border-border rounded-lg p-6 hover:border-accent transition-colors group shadow-sm"
          >
            <div className="flex items-center gap-3 mb-2">
              <svg className="w-5 h-5 text-accent" fill="currentColor" viewBox="0 0 24 24">
                <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.475-2.236-1.986-2.236-1.081 0-1.722.725-2.004 1.425-.103.25-.129.599-.129.948v5.432h-3.554s.05-8.736 0-9.646h3.554v1.364c.429-.686 1.685-1.665 4.108-1.665 3.002 0 5.25 1.965 5.25 6.175v5.772zM5.337 8.855c-1.144 0-1.915-.762-1.915-1.715 0-.956.77-1.715 1.959-1.715 1.188 0 1.915.759 1.915 1.715 0 .953-.727 1.715-1.959 1.715zm1.646 11.597H3.582V9.183h3.401v11.269zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.225 0z" />
              </svg>
              <h3 className="font-semibold text-foreground group-hover:text-accent transition-colors">LinkedIn</h3>
            </div>
            <p className="text-muted-foreground text-sm">Visit my profile</p>
          </a>

          <a
            href={CONTACT_LINKS.github}
            target="_blank"
            rel="noopener noreferrer"
            title="Open GitHub profile"
            className="bg-white border border-border rounded-lg p-6 hover:border-accent transition-colors group shadow-sm"
          >
            <div className="flex items-center gap-3 mb-2">
              <svg className="w-5 h-5 text-accent" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v 3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z" />
              </svg>
              <h3 className="font-semibold text-foreground group-hover:text-accent transition-colors">GitHub</h3>
            </div>
            <p className="text-muted-foreground text-sm">Check my projects</p>
          </a>
        </div>

        <div className="bg-secondary border border-border rounded-lg p-8 space-y-4">
          <h3 className="text-lg font-semibold text-foreground">Quick Links</h3>
          <ul className="space-y-3 text-foreground">
            <li>
              <a href={`mailto:${CONTACT_LINKS.email}`} title="Send an email" className="text-accent hover:text-primary transition-colors flex items-center gap-2">
                <span>✉️</span> Send me an email
              </a>
            </li>
            <li>
              <a href={CONTACT_LINKS.linkedin} target="_blank" rel="noopener noreferrer" title="Open LinkedIn profile" className="text-accent hover:text-primary transition-colors flex items-center gap-2">
                <span>💼</span> Connect on LinkedIn
              </a>
            </li>
            <li>
              <a href={CONTACT_LINKS.github} target="_blank" rel="noopener noreferrer" title="Open GitHub profile" className="text-accent hover:text-primary transition-colors flex items-center gap-2">
                <span>💻</span> Follow on GitHub
              </a>
            </li>
            <li>
              <a href={`tel:${CONTACT_LINKS.phoneHref}`} title="Call directly" className="text-accent hover:text-primary transition-colors flex items-center gap-2">
                <span>📱</span> Call me directly
              </a>
            </li>
            <li>
              <a href={CONTACT_LINKS.whatsapp} target="_blank" rel="noopener noreferrer" title="Chat on WhatsApp" className="text-accent hover:text-primary transition-colors flex items-center gap-2">
                <span>💬</span> Chat on WhatsApp
              </a>
            </li>
          </ul>
        </div>
      </div>
    </section>
  );
}
