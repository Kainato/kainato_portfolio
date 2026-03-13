import 'package:flutter/material.dart';
import 'package:kainato_portfolio/core/widgets/layout/kp_app_bar.dart';

class KpScaffold extends StatefulWidget {
  final Widget? body;
  const KpScaffold({super.key, required this.body});

  @override
  State<KpScaffold> createState() => _KpScaffoldState();
}

class _KpScaffoldState extends State<KpScaffold> {
  Widget get body => widget.body ?? Placeholder();
  ScrollPhysics get scrollable => body is Placeholder
      ? const NeverScrollableScrollPhysics()
      : const PageScrollPhysics();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KpAppBar(),
      body: SingleChildScrollView(physics: scrollable, child: body),
    );
  }
}
