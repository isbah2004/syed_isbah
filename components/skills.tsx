export default function Skills() {
  const skillCategories = [
    {
      category: 'Mobile Development',
      skills: ['Flutter', 'Dart', 'iOS (Swift)', 'Android (Kotlin/Java)', 'Cross-Platform Architecture'],
    },
    {
      category: 'State Management',
      skills: ['BLoC', 'GetX', 'Provider'],
    },
    {
      category: 'AI/ML Integration',
      skills: ['Voice AI', 'Speech-to-Text', 'Real-time Feedback Loops', 'Intelligent Interactions'],
    },
    {
      category: 'Backend & Cloud',
      skills: ['FastAPI', 'Firebase Ecosystem', 'Appwrite', 'GraphQL', 'RESTful APIs'],
    },
    {
      category: 'Databases',
      skills: ['NoSQL', 'PostgreSQL', 'MySQL', 'SQLite', 'Hive', 'Database Optimization'],
    },
    {
      category: 'Development Practices',
      skills: ['Clean Architecture', 'Clean Code', 'Agile/Scrum', 'Full Lifecycle App Development', 'Performance Optimization'],
    },
  ];

  return (
    <section className="space-y-8">
      <h2 className="text-3xl lg:text-4xl font-bold text-foreground mb-8">Skills</h2>
      <div className="space-y-8">
        {skillCategories.map((cat, index) => (
          <div key={index}>
            <h3 className="text-lg font-semibold text-accent mb-4">{cat.category}</h3>
            <div className="flex flex-wrap gap-2">
              {cat.skills.map((skill, i) => (
                <div
                  key={i}
                  className="px-4 py-2 bg-secondary border border-border rounded-lg text-sm text-foreground hover:border-accent hover:bg-white transition-colors"
                >
                  {skill}
                </div>
              ))}
            </div>
          </div>
        ))}
      </div>
    </section>
  );
}
