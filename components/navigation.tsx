'use client';

import { useState, useEffect } from 'react';
import { Menu } from 'lucide-react';
import {
  Sheet,
  SheetClose,
  SheetContent,
  SheetDescription,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
} from '@/components/ui/sheet';

interface NavigationProps {
  activeSection?: string;
  setActiveSection?: (section: string) => void;
}

export default function Navigation({ }: NavigationProps) {
  const [activeSection, setActiveSection] = useState('about');
  const [isScrolled, setIsScrolled] = useState(false);
  const sections = ['about', 'experience', 'skills', 'projects', 'contact'];

  useEffect(() => {
    const handleScroll = () => {
      setIsScrolled(window.scrollY > 8);

      for (const section of sections) {
        const element = document.getElementById(section);
        if (element) {
          const rect = element.getBoundingClientRect();
          if (rect.top <= 150 && rect.bottom >= 150) {
            setActiveSection(section);
            break;
          }
        }
      }
    };

    window.addEventListener('scroll', handleScroll);
    handleScroll();
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  const scrollToSection = (sectionId: string) => {
    const element = document.getElementById(sectionId);
    if (element) {
      element.scrollIntoView({ behavior: 'smooth' });
      setActiveSection(sectionId);
    }
  };

  return (
    <>
      <nav className={`appbar fixed inset-x-0 top-0 z-50 hidden border-b border-border md:block ${isScrolled ? 'appbar-scrolled' : 'appbar-top'}`}>
        <div className="max-w-6xl mx-auto px-6 py-4">
          <div className="flex items-center justify-between gap-8">
            <h2 className="text-lg font-bold text-accent whitespace-nowrap">Syed Isbah</h2>

            <div className="flex gap-2 overflow-x-auto md:gap-4">
              {sections.map((section) => (
                <button
                  key={section}
                  onClick={() => scrollToSection(section)}
                  title={`Go to ${section}`}
                  className={`px-4 py-2 rounded-lg text-sm font-medium transition-colors whitespace-nowrap ${
                    activeSection === section
                      ? 'bg-accent text-white'
                      : 'text-foreground hover:bg-secondary'
                  }`}
                >
                  {section.charAt(0).toUpperCase() + section.slice(1)}
                </button>
              ))}
            </div>
          </div>
        </div>
      </nav>

      <div className="fixed top-4 right-4 z-50 md:hidden">
        <Sheet>
          <SheetTrigger
            title="Open navigation menu"
            className="inline-flex h-11 w-11 items-center justify-center rounded-full border border-border bg-background/95 text-foreground shadow-lg backdrop-blur"
          >
            <Menu className="h-5 w-5" />
            <span className="sr-only">Open menu</span>
          </SheetTrigger>
          <SheetContent side="right" className="w-[80%] max-w-[300px]">
            <SheetHeader>
              <SheetTitle className="text-accent">Syed Isbah</SheetTitle>
              <SheetDescription>Navigate sections</SheetDescription>
            </SheetHeader>

            <div className="flex flex-col gap-2 px-4 pb-6">
              {sections.map((section) => (
                <SheetClose key={section} asChild>
                  <button
                    onClick={() => scrollToSection(section)}
                    title={`Go to ${section}`}
                    className={`w-full rounded-lg px-4 py-3 text-left text-sm font-medium transition-colors ${
                      activeSection === section
                        ? 'bg-accent text-white'
                        : 'bg-secondary text-foreground hover:bg-secondary/70'
                    }`}
                  >
                    {section.charAt(0).toUpperCase() + section.slice(1)}
                  </button>
                </SheetClose>
              ))}
            </div>
          </SheetContent>
        </Sheet>
      </div>
    </>
  );
}
