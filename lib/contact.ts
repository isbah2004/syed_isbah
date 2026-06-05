import { z } from 'zod';

export const CONTACT_LINKS = {
  email: 'syedisbah50@gmail.com',
  phoneDisplay: '+92 307 2118499',
  phoneHref: '+923072118499',
  whatsapp: 'https://wa.me/923072118499?text=Hi%20Syed%2C%20I%20visited%20your%20portfolio%20and%20would%20like%20to%20connect.',
  linkedin: 'https://www.linkedin.com/in/syed-isbah-9073b429b/',
  github: 'https://github.com/isbah2004',
  resume: '/resume.pdf',
} as const;

export const contactFormSchema = z.object({
  email: z
    .string()
    .trim()
    .email('Enter a valid email address')
    .max(120, 'Email is too long'),
  subject: z
    .string()
    .trim()
    .min(3, 'Subject must be at least 3 characters')
    .max(120, 'Subject must be 120 characters or less'),
  message: z
    .string()
    .trim()
    .min(10, 'Message must be at least 10 characters')
    .max(4000, 'Message must be 4000 characters or less'),
  website: z.string().max(0).optional().default(''),
});

export type ContactFormInput = z.infer<typeof contactFormSchema>;