import 'package:flutter/material.dart';
import 'package:kainato_portfolio/core/routes/kp_routes.dart';

import 'app/home/home_page.dart';

/// O *[MainApp]* é um widget sem estado que representa a aplicação Flutter.
/// Ele define o título do aplicativo, as rotas disponíveis, a rota inicial e o tema do aplicativo.
/// A página inicial é definida como *[HomePage]*.
///
/// Variáveis:
/// - **[title]:** O título do aplicativo.
/// - **[routes]:** Um mapa de rotas disponíveis na aplicação. Definido por uma variável construída a partir do enum *[KpRoutes]*.
/// - **[initialRoute]:** A rota inicial que será exibida ao iniciar o aplicativo. Definida pelo enum *[KpRoutes]*.
/// - **[theme]:** O tema centralizado do aplicativo (paleta, tipografia e componentes).
/// - **[home]:** A página inicial do aplicativo, definida como *[HomePage]*.
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static const Color accentColor = Color(0xFF9B85FF);

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Caio Calado — Flutter Developer',
    routes: allAppRoutes,
    initialRoute: KpRoutes.home.path,
    theme: _buildTheme(),
    home: const HomePage(),
    // Deep links desconhecidos caem de volta na Home em vez de uma tela de erro.
    onUnknownRoute: (settings) =>
        MaterialPageRoute(builder: (_) => const HomePage()),
  );

  ThemeData _buildTheme() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: accentColor,
      brightness: Brightness.dark,
      primary: accentColor,
      surface: const Color(0xFF0B0D12),
    );

    final baseTextTheme = ThemeData.dark().textTheme.apply(
      bodyColor: Colors.white70,
      displayColor: Colors.white,
    );

    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      textTheme: baseTextTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xEE0B0D12),
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF161922),
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      drawerTheme: const DrawerThemeData(backgroundColor: Color(0xFF0F1117)),
      dividerTheme: const DividerThemeData(color: Colors.white12),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: accentColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.white24),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: Colors.white),
      ),
    );
  }
}
