import Image from 'next/image';
import innovativeLogo from '../assets/innovative_logo.png';
import lotteLogo from '../assets/lotte_chemicals_logo.png';
import pipfaLogo from '../assets/pipfa_logo.png';

export default function Experience() {
  const experiences = [
    {
      role: 'Flutter Developer',
      company: 'Innovative Widget',
      logo: innovativeLogo,
      location: 'Karachi, Pakistan (On-site)',
      period: 'Sep 2024 – Mar 2026',
      description: 'Led frontend mobile engineering using Clean Architecture and BLoC, translating Figma designs into pixel-perfect, 60 FPS interfaces.',
      highlights: [
        'Collaborated with cross-functional teams to integrate RESTful/GraphQL APIs',
        'Resolved memory leaks and optimized rendering cycles',
        'Improved general app load times by 25%',
      ],
    },
    {
      role: 'Flutter Intern',
      company: 'LOTTE Chemical Pakistan Limited',
      logo: lotteLogo,
      location: 'Karachi, Pakistan (On-site)',
      period: 'Jul 2024 – Aug 2024',
      description: 'Assisted senior developers in prototyping internal Flutter apps for inventory tracking and logistics.',
      highlights: [
        'Gained hands-on experience with localized databases (SQLite/Hive)',
        'Implemented state management solutions',
        'Contributed to weekly sprints and code reviews',
      ],
    },
    {
      role: 'Mobile Application Developer',
      company: 'Pakistan Institute of Public Finance Accountants (PIPFA)',
      logo: pipfaLogo,
      location: 'Remote',
      period: 'Dec 2025 – Present',
      description: 'Developed secure, high-performance Flutter/Dart accounting apps featuring data-heavy dashboards and secure authentication.',
      highlights: [
        'Built secure authentication systems with industry best practices',
        'Managed data-heavy dashboards for financial tracking',
        'Optimized legacy API integrations under organizational data policies',
      ],
    },
  ];

  return (
    <section className="space-y-8">
      <h2 className="text-3xl lg:text-4xl font-bold text-foreground mb-8">Experience</h2>
      <div className="space-y-12">
        {experiences.map((exp, index) => (
          <div key={index} className="border-l-4 border-accent pl-6 pb-8">
            <div className="flex flex-col sm:flex-row sm:items-start sm:justify-between gap-2 mb-3">
              <div className="flex items-start gap-4">
                <div className="relative h-12 w-12 shrink-0 overflow-hidden rounded-xl border border-border bg-background p-1.5 shadow-sm">
                  <Image src={exp.logo} alt={`${exp.company} logo`} fill className="object-contain" sizes="48px" />
                </div>
                <div>
                  <h3 className="text-xl font-semibold text-foreground">{exp.role}</h3>
                  <p className="text-accent font-medium">{exp.company}</p>
                </div>
              </div>
              <div className="text-sm text-muted-foreground whitespace-nowrap">{exp.period}</div>
            </div>
            <p className="text-sm text-muted-foreground mb-4">{exp.location}</p>
            <p className="text-base text-foreground mb-4">{exp.description}</p>
            <ul className="space-y-2 text-sm text-foreground">
              {exp.highlights.map((highlight, i) => (
                <li key={i} className="flex gap-3">
                  <span className="text-accent mt-1">•</span>
                  <span>{highlight}</span>
                </li>
              ))}
            </ul>
          </div>
        ))}
      </div>
    </section>
  );
}
