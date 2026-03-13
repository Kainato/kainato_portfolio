import 'package:flutter/material.dart';

class KpAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KpAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Caio Calado de Araújo'),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
