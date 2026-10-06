/// Representa um projeto/case exibido na seção "Projetos".
class PortfolioProject {
  final String order;
  final String title;
  final String subtitle;
  final String stack;
  final String description;
  final String? url;

  const PortfolioProject({
    required this.order,
    required this.title,
    required this.subtitle,
    required this.stack,
    required this.description,
    this.url,
  });
}
