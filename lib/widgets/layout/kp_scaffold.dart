import 'package:flutter/material.dart';
import 'package:kainato_portfolio/widgets/layout/kp_app_bar.dart';

import '../../core/routes/kp_routes.dart';

class KpScaffold extends StatefulWidget {
  final Widget? body;
  final KpRoutes? route;
  const KpScaffold({super.key, required this.body, this.route});

  @override
  State<KpScaffold> createState() => _KpScaffoldState();
}

class _KpScaffoldState extends State<KpScaffold> {
  Widget get body => widget.body ?? Placeholder();
  // ScrollPhysics get scrollable => body is Placeholder
  //     ? const NeverScrollableScrollPhysics()
  //     : const PageScrollPhysics();
  // Widget? get drawer =>
  //     widget.route != null ? KpDrawer(route: widget.route!) : null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KpAppBar(),
      // drawer: drawer,
      body: body,
    );
  }
}
