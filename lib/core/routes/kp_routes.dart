import 'package:flutter/material.dart';

import '../../app/home/home_page.dart';

enum KpRoutes { home }

extension KpRoutesExtension on KpRoutes {
  String get name {
    switch (this) {
      case KpRoutes.home:
        return 'Home';
    }
  }

  String get path {
    switch (this) {
      case KpRoutes.home:
        return '/';
    }
  }

  IconData get icon {
    switch (this) {
      case KpRoutes.home:
        return Icons.home_outlined;
    }
  }

  WidgetBuilder get builder {
    switch (this) {
      case KpRoutes.home:
        return (context) => const HomePage();
    }
  }
}

/// Rotas nomeadas do app (exceto home, definida via `home` no [MaterialApp]).
Map<String, WidgetBuilder> get allAppRoutes => {
  for (final route in KpRoutes.values.where((r) => r != KpRoutes.home))
    route.path: route.builder,
};
