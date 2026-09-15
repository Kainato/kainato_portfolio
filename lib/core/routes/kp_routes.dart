import 'package:flutter/material.dart';

import '../../app/certificados/certificados_page.dart';
import '../../app/home/home_page.dart';

enum KpRoutes { home, certificados }

extension KpRoutesExtension on KpRoutes {
  String get name {
    switch (this) {
      case KpRoutes.home:
        return 'Home';
      case KpRoutes.certificados:
        return 'Certificados';
    }
  }

  String get path {
    switch (this) {
      case KpRoutes.home:
        return '/';
      case KpRoutes.certificados:
        return '/certificados';
    }
  }

  IconData get icon {
    switch (this) {
      case KpRoutes.home:
        return Icons.home_outlined;
      case KpRoutes.certificados:
        return Icons.workspace_premium_outlined;
    }
  }

  WidgetBuilder get builder {
    switch (this) {
      case KpRoutes.home:
        return (context) => const HomePage();
      case KpRoutes.certificados:
        return (context) => const CertificadosPage();
    }
  }
}

/// Rotas nomeadas do app (exceto home, definida via `home` no [MaterialApp]).
Map<String, WidgetBuilder> get allAppRoutes => {
  for (final route in KpRoutes.values.where((r) => r != KpRoutes.home))
    route.path: route.builder,
};
