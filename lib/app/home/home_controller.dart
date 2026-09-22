import 'package:flutter/material.dart';

class HomeController {
  HomeController();
  final GlobalKey<State<StatefulWidget>> sobreKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> projetosKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> contatoKey = GlobalKey();

  void scrollToSection(String id) {
    final key = switch (id) {
      'sobre' => sobreKey,
      'projetos' => projetosKey,
      'contato' => contatoKey,
      _ => null,
    };
    final sectionContext = key?.currentContext;
    if (sectionContext != null) {
      Scrollable.ensureVisible(
        sectionContext,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }
}
