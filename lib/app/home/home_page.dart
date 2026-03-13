import 'package:flutter/material.dart';
import 'package:kainato_portfolio/core/enum/assets.dart';

import '../../core/extension/context_extension.dart';
import '../../core/widgets/base/section_tile.dart';
import '../../core/widgets/layout/kp_app_bar.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Flexible(
                flex: 3,
                child: ListTile(
                  title: Text(
                    'Hello, I am Caio!',
                    style: context.displayMedium,
                  ),
                  subtitle: Text(
                    'A front-end developer who loves to create new app ideas and bring them to life using design and code tools, for both mobile and web devices.',
                    style: context.titleSmall,
                  ),
                ),
              ),
              Flexible(flex: 1, child: Image.asset(Assets.dashatar.path)),
            ],
          ),
          SectionTile(title: 'Hard-skills', icon: Icons.book),
        ],
      ),
    );
  }
}
