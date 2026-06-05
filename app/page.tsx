'use client';

import Image from 'next/image';
import Navigation from '@/components/navigation';
import About from '@/components/about';
import Experience from '@/components/experience';
import Skills from '@/components/skills';
import Projects from '@/components/projects';
import Contact from '@/components/contact';
import profilePhoto from '../assets/IMG_4043.jpg';
import { CONTACT_LINKS } from '@/lib/contact';

const highlights = [
  { value: '3+', label: 'years building mobile apps' },
  { value: '5+', label: 'apps published' },
  { value: '60 FPS', label: 'focus on smooth UI' },
];

const floatingTags = ['Flutter', 'Dart', 'BLoC', 'Firebase', 'Clean Architecture'];

export default function Home() {
  const scrollToSection = (sectionId: string) => {
    const element = document.getElementById(sectionId);
    if (element) {
      element.scrollIntoView({ behavior: 'smooth' });
    }
  };

  return (
    <div className="hero-shell min-h-screen bg-background text-foreground">
      <Navigation />
      
      <main className="max-w-6xl mx-auto px-6 pt-28 pb-12 lg:pt-32 lg:pb-16">
        <section className="relative overflow-hidden rounded-[2rem] border border-border bg-[linear-gradient(135deg,rgba(59,130,246,0.14),rgba(255,255,255,0.95)_35%,rgba(37,99,235,0.08))] px-6 py-12 shadow-[0_24px_80px_rgba(15,23,42,0.08)] lg:px-10 lg:py-16">
          <div className="hero-glow hero-glow-left" />
          <div className="hero-glow hero-glow-right" />

          <div className="relative grid items-center gap-12 lg:grid-cols-[1.15fr_0.85fr]">
            <div className="space-y-8">
              <div className="inline-flex w-fit items-center gap-2 rounded-full border border-border bg-white/80 px-4 py-2 text-sm font-medium text-muted-foreground shadow-sm backdrop-blur">
                <span className="h-2 w-2 rounded-full bg-accent animate-pulse" />
                Mobile developer crafting polished Flutter experiences
              </div>

              <div className="space-y-5">
                <h1 className="max-w-3xl text-4xl font-bold tracking-tight text-foreground sm:text-5xl lg:text-7xl">
                  Designing fast, thoughtful mobile apps that feel effortless to use.
                </h1>
                <p className="max-w-2xl text-base leading-8 text-muted-foreground sm:text-lg">
                  I build Flutter products with clean architecture, sharp motion, and careful performance work so every screen feels precise, responsive, and ready for real users.
                </p>
              </div>

              <div className="flex flex-col gap-4 sm:flex-row">
                <button
                  onClick={() => scrollToSection('contact')}
                  title="Go to contact section"
                  className="inline-flex items-center justify-center rounded-full bg-accent px-6 py-3 text-sm font-semibold text-accent-foreground transition-transform duration-300 hover:-translate-y-0.5 hover:bg-accent/90"
                >
                  Let&apos;s talk
                </button>
                <button
                  onClick={() => scrollToSection('projects')}
                  title="Go to projects section"
                  className="inline-flex items-center justify-center rounded-full border border-border bg-white px-6 py-3 text-sm font-semibold text-foreground transition-transform duration-300 hover:-translate-y-0.5 hover:border-accent hover:text-accent"
                >
                  View projects
                </button>
                <a
                  href={CONTACT_LINKS.resume}
                  target="_blank"
                  rel="noopener noreferrer"
                  title="Download resume (PDF)"
                  className="inline-flex items-center justify-center rounded-full border border-border bg-white px-6 py-3 text-sm font-semibold text-foreground transition-transform duration-300 hover:-translate-y-0.5 hover:border-accent hover:text-accent"
                >
                  Resume
                </a>
              </div>

              <div className="grid gap-4 sm:grid-cols-3">
                {highlights.map((item, index) => (
                  <div
                    key={item.label}
                    className="hero-fade-up rounded-2xl border border-border bg-white/80 p-4 shadow-sm backdrop-blur"
                    style={{ animationDelay: `${index * 120}ms` }}
                  >
                    <div className="text-2xl font-bold text-foreground">{item.value}</div>
                    <p className="mt-1 text-sm leading-6 text-muted-foreground">{item.label}</p>
                  </div>
                ))}
              </div>
            </div>

            <div className="relative mx-auto w-full max-w-md lg:justify-self-end">
              <div className="hero-orb hero-orb-top" />
              <div className="hero-orb hero-orb-bottom" />

              <div className="hero-float rounded-[2rem] border border-border bg-white/90 p-5 shadow-[0_28px_80px_rgba(15,23,42,0.12)] backdrop-blur">
                <div className="relative overflow-hidden rounded-[1.5rem] border border-border bg-background">
                  <Image
                    src={profilePhoto}
                    alt="Syed Isbah portrait"
                    className="h-[420px] w-full object-cover object-top"
                    priority
                  />
                  <div className="absolute inset-0 bg-[linear-gradient(180deg,rgba(255,255,255,0)_50%,rgba(15,23,42,0.25))]" />
                </div>

                <div className="mt-5 grid gap-3 sm:grid-cols-2">
                  <div className="rounded-2xl bg-secondary p-4">
                    <p className="text-xs font-semibold uppercase tracking-[0.24em] text-muted-foreground">Current focus</p>
                    <p className="mt-2 text-sm font-medium text-foreground">Flutter, Firebase, and UI motion that feels alive.</p>
                  </div>
                  <div className="rounded-2xl bg-secondary p-4">
                    <p className="text-xs font-semibold uppercase tracking-[0.24em] text-muted-foreground">Availability</p>
                    <p className="mt-2 text-sm font-medium text-foreground">Open to freelance and full-time product work.</p>
                  </div>
                </div>

                <div className="mt-4 flex flex-wrap gap-2">
                  {floatingTags.map((tag, index) => (
                    <span
                      key={tag}
                      className="hero-pulse rounded-full border border-border bg-white px-3 py-1 text-xs font-medium text-muted-foreground"
                      style={{ animationDelay: `${index * 140}ms` }}
                    >
                      {tag}
                    </span>
                  ))}
                </div>
              </div>
            </div>
          </div>
        </section>

        <div className="mb-20">
          <section id="about">
            <About />
          </section>
        </div>

        <div className="mb-20">
          <section id="experience">
            <Experience />
          </section>
        </div>

        <div className="mb-20">
          <section id="skills">
            <Skills />
          </section>
        </div>

        <div className="mb-20">
          <section id="projects">
            <Projects />
          </section>
        </div>

        <div>
          <section id="contact">
            <Contact />
          </section>
        </div>
      </main>
    </div>
  );
}
