import 'package:flutter/material.dart';

import '../../core/extension/context_extension.dart';
import '../../core/routes/kp_routes.dart';
import '../../core/utils/kp_launcher.dart';
import '../base/kp_appbar_action.dart';

class _NavSection {
  final String id;
  final String label;
  final String? externalUrl;

  const _NavSection({required this.id, required this.label, this.externalUrl});

  bool get isExternal => externalUrl != null;
}

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

  /// Seções de navegação disponíveis no app bar.
  static const _sections = [
    _NavSection(id: 'sobre', label: 'Sobre'),
    _NavSection(id: 'projetos', label: 'Projetos'),
    _NavSection(id: 'contato', label: 'Contato'),
    _NavSection(
      id: 'certificados',
      label: 'Certificados',
      externalUrl:
          'https://www.linkedin.com/in/kainato/details/certifications/',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final bool isMobile = context.isMobile;

    return AppBar(
      title: const Text('Caio Calado'),
      actions: [
        if (!isMobile) ...[
          for (final section in _sections)
            KpAppbarAction(
              label: section.label,
              onSectionTap: () => _handleSectionTap(context, section),
            ),
          const SizedBox(width: 8),
        ],
      ],
    );
  }

  void _handleSectionTap(BuildContext context, _NavSection section) {
    if (section.isExternal) {
      openExternalUrl(context, section.externalUrl!);
    } else {
      onSectionTap?.call(section.id);
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
