import 'package:flutter/material.dart';

import '../../core/extension/context_extension.dart';
import '../../core/routes/kp_routes.dart';
import '../base/kp_appbar_action.dart';

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

  /// Seções de navegação disponíveis no app bar que redirecionam para diferentes partes da `HomePage`. Cada seção é representada por um par `(id, label)`.
  static const _sections = [
    ('sobre', 'Sobre'),
    ('projetos', 'Projetos'),
    ('contato', 'Contato'),
  ];

  /// Manipula o toque em uma seção do app bar.
  ///
  /// Se um callback `onSectionTap` for fornecido, ele será chamado com o `id` da seção.
  /// Caso contrário, a navegação padrão redireciona para a página inicial.
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

  @override
  Widget build(BuildContext context) {
    final bool isMobile = context.isMobile;

    return AppBar(
      title: const Text('Caio Calado'),
      actions: [
        if (!isMobile) ...[
          for (final section in _sections)
            KpAppbarAction(
              label: section.$2,
              onSectionTap: () => _handleSectionTap(context, section.$1),
            ),
          const SizedBox(width: 8),
        ],
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
