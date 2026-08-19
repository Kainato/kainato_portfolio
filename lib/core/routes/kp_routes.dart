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
        return Icons.home;
    }
  }

  Map<String, Widget Function(BuildContext)> get routes {
    switch (this) {
      case KpRoutes.home:
        return {KpRoutes.home.path: (context) => const HomePage()};
    }
  }
}

/// Atalho para obter todas as rotas do aplicativo (exceto home)
Map<String, Widget Function(BuildContext)> get allAppRoutes {
  final routes = <String, Widget Function(BuildContext)>{};
  for (final route in KpRoutes.values.where((r) => r != KpRoutes.home)) {
    routes.addAll(route.routes);
  }
  return routes;
}
