export default function Projects() {
  const projects = [
    {
      title: 'InterviewAce - AI Interview Practice Platform',
      description: 'Comprehensive Flutter mobile app revolutionizing interview preparation with AI-powered voice simulations, real-time feedback, dynamic MCQ challenges across multiple job categories, and performance analytics. Features BLoC state management, Firebase backend, and Cloud Firestore for real-time synchronization with clean architecture and scalable design.',
      tech: ['Flutter', 'Dart', 'Firebase', 'BLoC', 'AI/ML', 'Cloud Firestore'],
      impact: 'Published on Google Play Store with active user base',
      period: 'Jun 2025 – Sep 2025',
    },
    {
      title: 'PIPFA Student Portal',
      description: 'Built a comprehensive Flutter + Firebase application for Pakistan Institute of Public Finance Accountants featuring a neumorphism dashboard with news, IFAC updates, events, circulars, gallery, and CPD webinars. Implemented dual-role SOAP authentication, sidebar navigation, and advanced notification stack combining FCM, local alerts, and backend bulletins with secure token handling.',
      tech: ['Flutter', 'Firebase', 'SOAP', 'BLoC', 'GetIt', 'GetStorage'],
      impact: 'Production-ready solution for financial institute',
      period: 'Jan 2026 – Present',
    },
    {
      title: 'SquareOne Community App',
      description: 'Built a customer-facing Flutter application for SquareOne Mall to showcase deals, discounts, and promotions in real-time. Implemented seamless integration with mall services and features intuitive UI for easy browsing of available offers.',
      tech: ['Flutter', 'Firebase', 'RESTful APIs'],
      impact: 'Helping customers discover mall offers',
      period: 'Dec 2024 – Feb 2025',
    },
  ];

  return (
    <section className="space-y-8">
      <h2 className="text-3xl lg:text-4xl font-bold text-foreground mb-8">Projects</h2>
      <div className="space-y-6">
        {projects.map((project, index) => (
          <div key={index} className="bg-white border border-border rounded-lg p-6 hover:border-accent transition-colors shadow-sm">
            <div className="flex flex-col sm:flex-row sm:items-start sm:justify-between gap-2 mb-3">
              <h3 className="text-xl font-semibold text-foreground">{project.title}</h3>
              {project.period && <p className="text-sm text-muted-foreground whitespace-nowrap">{project.period}</p>}
            </div>
            <p className="text-foreground mb-4 leading-relaxed">{project.description}</p>
            
            <div className="mb-4">
              <div className="flex flex-wrap gap-2 mb-3">
                {project.tech.map((tech, i) => (
                  <span key={i} className="text-xs px-3 py-1 bg-background rounded-full text-accent border border-border">
                    {tech}
                  </span>
                ))}
              </div>
            </div>

            <p className="text-sm text-accent font-medium">✨ {project.impact}</p>
          </div>
        ))}
      </div>


    </section>
  );
}
