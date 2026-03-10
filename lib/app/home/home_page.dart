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
      body: Center(child: Text('Hello World!')),
    );
  }
}
