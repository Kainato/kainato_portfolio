import 'package:flutter/material.dart';

import '../../core/data/portfolio_data.dart';
import '../../core/extension/context_extension.dart';
import '../../core/routes/kp_routes.dart';
import '../../core/utils/kp_launcher.dart';

class KpDrawer extends StatelessWidget {
  /// A página (rota) atual exibida no drawer.
  final KpRoutes route;
  /// Callback acionado quando uma seção é tocada no drawer.
  final void Function(String sectionId)? onSectionTap;

  /// `KpDrawer` é um widget de drawer personalizado que exibe seções de navegação e links de contato.
  ///
  /// ### Parâmetros
  /// - `route`: A página (rota) atual.
  /// - `onSectionTap`: Callback acionado quando uma seção é tocada.
  const KpDrawer({super.key, required this.route, this.onSectionTap});

  /// Seções de navegação exibidas no drawer. Cada tupla contém o ID da seção, o título e o ícone correspondente.
  static const _sections = [
    ('sobre', 'Sobre', Icons.person_outline),
    ('projetos', 'Projetos', Icons.work_outline),
    ('contato', 'Contato', Icons.mail_outline),
  ];

  /// Manipula o toque em uma seção do drawer. Fecha o drawer e aciona o callback `onSectionTap` se fornecido. Caso contrário, navega para a página inicial.
  void _handleSectionTap(BuildContext context, String id) {
    Navigator.pop(context);
    final onTap = onSectionTap;
    if (onTap != null) {
      onTap(id);
    } else {
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil(KpRoutes.home.path, (r) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Text(PortfolioData.name, style: context.displaySmall),
              ),
            ),
            for (final section in _sections)
              Semantics(
                button: true,
                label: 'Ir para a seção ${section.$2}',
                child: ListTile(
                  leading: Icon(section.$3),
                  title: Text(section.$2),
                  onTap: () => _handleSectionTap(context, section.$1),
                ),
              ),
            const Divider(),
            for (final r in KpRoutes.values)
              Semantics(
                button: true,
                selected: r == route,
                label: 'Ir para a página ${r.name}',
                child: ListTile(
                  leading: Icon(r.icon),
                  title: Text(r.name),
                  selected: r == route,
                  onTap: () {
                    Navigator.pop(context);
                    if (r != route) Navigator.of(context).pushNamed(r.path);
                  },
                ),
              ),
            const Divider(),
            for (final link in PortfolioData.contactLinks)
              Semantics(
                button: true,
                label: 'Abrir ${link.label}: ${link.value}',
                child: ListTile(
                  leading: Icon(link.icon, size: 20),
                  title: Text(link.value, overflow: TextOverflow.ellipsis),
                  onTap: () {
                    Navigator.pop(context);
                    openExternalUrl(context, link.url);
                  },
                ),
              ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
