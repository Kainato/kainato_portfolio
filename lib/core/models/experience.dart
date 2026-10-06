/// Um destaque/realização dentro de uma experiência profissional.
class ExperienceHighlight {
  final String title;
  final String description;

  const ExperienceHighlight({required this.title, required this.description});
}

/// Uma experiência profissional listada no currículo.
class Experience {
  final String company;
  final String role;
  final String period;
  final List<ExperienceHighlight> highlights;

  const Experience({
    required this.company,
    required this.role,
    required this.period,
    required this.highlights,
  });
}
