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
/// - **[theme]:** O tema do aplicativo, definido pelo *[ThemeData.dark()]*.
/// - **[home]:** A página inicial do aplicativo, definida como *[HomePage]*.
class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    // debugShowCheckedModeBanner: false,
    title: 'Caio Araújo — Flutter Developer',
    routes: allAppRoutes,
    initialRoute: KpRoutes.home.path,
    theme: ThemeData.dark(),
    home: const HomePage(),
  );
}
