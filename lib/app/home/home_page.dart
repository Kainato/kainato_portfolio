import 'package:flutter/material.dart';

import '../../core/widgets/kp_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KpAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: const [
          Text('Bem-vindo ao meu portfólio!'),
          Divider(),
          Text('Aqui você encontrará meus projetos e experiências.'),
        ],
      ),
    );
  }
}
