import 'package:flutter/material.dart';
import 'package:kainato_portfolio/core/enum/assets.dart';
import 'package:kainato_portfolio/core/enum/hard_skill.dart';
import 'package:kainato_portfolio/core/enum/soft_skill.dart';

import '../../core/extension/context_extension.dart';
import '../../core/widgets/base/section_tile.dart';
import '../../core/widgets/base/skill_chip.dart';
import '../../core/widgets/layout/kp_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return KpScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        spacing: 16.0,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              spacing: 8.0,
              children: [
                Flexible(
                  flex: 3,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
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
          ),
          SectionHeaderTile(title: 'Hard-skills', icon: Icons.book),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: HardSkill.values
                .map(
                  (skill) => SkillChip(
                    label: skill.name,
                    labelColor: skill.onColor,
                    hoverColor: skill.color,
                  ),
                )
                .toList(),
          ),
          SectionHeaderTile(title: 'Soft-skills', icon: Icons.book),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: SoftSkill.values
                .map(
                  (skill) => SkillChip(
                    label: skill.name,
                    avatar: Icon(
                      skill.icon,
                      size: 16.0,
                      color: context.onSurfaceColor,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
