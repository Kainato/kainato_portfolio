import 'package:flutter/material.dart';

import '../../core/data/portfolio_data.dart';
import '../../core/extension/context_extension.dart';
import '../../core/routes/kp_routes.dart';
import '../../core/utils/kp_launcher.dart';

class KpDrawer extends StatelessWidget {
  final KpRoutes route;
  final void Function(String sectionId)? onSectionTap;

  const KpDrawer({super.key, required this.route, this.onSectionTap});

  static const _sections = [
    ('sobre', 'Sobre', Icons.person_outline),
    ('projetos', 'Projetos', Icons.work_outline),
    ('contato', 'Contato', Icons.mail_outline),
  ];

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
