import 'package:flutter/material.dart';

class KpAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KpAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Adicionar no tema principal do App
    final menuButtonStyle = ButtonStyle(
      mouseCursor: const WidgetStatePropertyAll(SystemMouseCursors.click),
    );

    return AppBar(
      backgroundColor: const Color(0xEE0B0D12),
      title: const Text('Caio Araújo'),
      actions: [
        TextButton(
          style: menuButtonStyle,
          onPressed: () => _onPressed(context),
          child: const Text('Sobre'),
        ),
        TextButton(
          style: menuButtonStyle,
          onPressed: () => _onPressed(context),
          child: const Text('Projetos'),
        ),
        TextButton(
          style: menuButtonStyle,
          onPressed: () => _onPressed(context),
          child: const Text('Contato'),
        ),
        const SizedBox(width: 18),
      ],
    );
  }

  void _onPressed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Em breve!'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
