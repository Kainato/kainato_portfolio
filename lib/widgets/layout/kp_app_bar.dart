import 'package:flutter/material.dart';

import '../../core/extension/context_extension.dart';
import '../../core/routes/kp_routes.dart';
import '../../core/utils/kp_launcher.dart';

class KpAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// A rota (página) atual exibida no app bar.
  final KpRoutes currentRoute;
  /// Callback acionado quando uma seção é tocada no app bar.
  final void Function(String sectionId)? onSectionTap;

  /// `KpAppBar` é um widget de app bar personalizado que exibe o título do portfólio e seções de navegação.
  ///
  /// ### Parâmetros
  /// - `currentRoute`: A página (rota) atual.
  /// - `onSectionTap`: Callback acionado quando uma seção é tocada.
  const KpAppBar({
    super.key,
    this.currentRoute = KpRoutes.home,
    this.onSectionTap,
  });

  static const _sections = [
    ('sobre', 'Sobre'),
    ('projetos', 'Projetos'),
    ('contato', 'Contato'),
  ];

  void _handleSectionTap(BuildContext context, String id) {
    final onTap = onSectionTap;
    if (onTap != null) {
      onTap(id);
    } else {
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil(KpRoutes.home.path, (route) => false);
    }
  }

  void _goToRoute(BuildContext context, KpRoutes route) {
    if (route == currentRoute) return;
    Navigator.of(context).pushNamed(route.path);
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;

    return AppBar(
      title: const Text('Caio Calado'),
      actions: [
        if (!isMobile) ...[
          for (final section in _sections)
            Semantics(
              button: true,
              label: 'Ir para a seção ${section.$2}',
              child: TextButton(
                onPressed: () => _handleSectionTap(context, section.$1),
                child: Text(section.$2),
              ),
            ),
          Semantics(
            button: true,
            label: 'Ir para a página de certificados',
            child: TextButton(
              onPressed: () => _goToRoute(context, KpRoutes.certificados),
              child: const Text('Certificados'),
            ),
          ),
          const SizedBox(width: 8),
        ],
        Semantics(
          button: true,
          label: 'Abrir perfil no GitHub em uma nova aba',
          child: IconButton(
            tooltip: 'GitHub',
            icon: const Icon(Icons.code),
            onPressed: () =>
                openExternalUrl(context, 'https://github.com/Kainato'),
          ),
        ),
        const SizedBox(width: 12),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
