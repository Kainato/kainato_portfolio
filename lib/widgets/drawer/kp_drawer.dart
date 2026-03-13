import 'package:flutter/material.dart';

import '../../core/extension/context_extension.dart';
import '../../core/routes/kp_routes.dart';

class KpDrawer extends Drawer {
  final KpRoutes route;
  const KpDrawer({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Text('Hello, How are you?', style: context.displaySmall),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: KpRoutes.values.length,
            itemBuilder: (context, index) {
              final KpRoutes route = KpRoutes.values[index];
              return ListTile(
                title: Text(route.name),
                trailing: Icon(route.icon),
                style: ListTileStyle.drawer,
                onTap: () {
                  if (route == this.route) {
                    Navigator.pop(context);
                    return;
                  } else {
                    Navigator.pushNamed(context, route.path);
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
