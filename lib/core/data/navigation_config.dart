import 'package:flutter/material.dart';

import '../routes/kp_routes.dart';

/// Item de navegação que pode ser usado tanto no AppBar quanto no Drawer
class NavigationItem {
  final String id;
  final String label;
  final IconData icon;
  final String? routePath;
  final String? externalUrl;
  final String semanticLabel;

  const NavigationItem({
    required this.id,
    required this.label,
    required this.icon,
    required this.semanticLabel,
    this.routePath,
    this.externalUrl,
  });

  bool get isRoute => routePath != null;
  bool get isExternal => externalUrl != null;
}

/// Configuração centralizada de navegação para toda a aplicação
class NavigationConfig {
  /// Itens de navegação principal (exibidos em AppBar e Drawer)
  static const List<NavigationItem> mainItems = [
    NavigationItem(
      id: 'sobre',
      label: 'Sobre',
      icon: Icons.person,
      routePath: '/home',
      semanticLabel: 'Ir para a seção Sobre',
    ),
    NavigationItem(
      id: 'projetos',
      label: 'Projetos',
      icon: Icons.work,
      routePath: '/home',
      semanticLabel: 'Ir para a seção Projetos',
    ),
    NavigationItem(
      id: 'contato',
      label: 'Contato',
      icon: Icons.email,
      routePath: '/home',
      semanticLabel: 'Ir para a seção Contato',
    ),
    NavigationItem(
      id: 'certificados',
      label: 'Certificados',
      icon: Icons.verified,
      externalUrl:
          'https://www.linkedin.com/in/kainato/details/certifications/',
      semanticLabel: 'Abrir certificações no LinkedIn',
    ),
  ];

  /// Itens de rota (para o Drawer)
  static List<NavigationItem> get routeItems => [
    for (final route in KpRoutes.values)
      NavigationItem(
        id: route.name,
        label: route.name,
        icon: route.icon,
        routePath: route.path,
        semanticLabel: 'Ir para a página ${route.name}',
      ),
  ];

  /// Obtém um item pelo ID
  static NavigationItem? getItemById(String id) {
    try {
      return mainItems.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }
}
