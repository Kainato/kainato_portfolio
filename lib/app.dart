import 'package:flutter/material.dart';
import 'package:kainato_portfolio/core/routes/kp_routes.dart';

import 'app/home/home_page.dart';

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
