import 'package:flutter/material.dart';
import 'package:kainato_portfolio/widgets/layout/kp_app_bar.dart';

import '../../core/extension/context_extension.dart';
import '../../core/routes/kp_routes.dart';
import '../drawer/kp_drawer.dart';

class KpScaffold extends StatelessWidget {
  final Widget? body;
  final KpRoutes route;
  final void Function(String sectionId)? onSectionTap;

  const KpScaffold({
    super.key,
    required this.body,
    this.route = KpRoutes.home,
    this.onSectionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KpAppBar(currentRoute: route, onSectionTap: onSectionTap),
      drawer: context.isMobile
          ? KpDrawer(route: route, onSectionTap: onSectionTap)
          : null,
      body: body ?? const Center(child: CircularProgressIndicator()),
    );
  }
}
