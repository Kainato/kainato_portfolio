import 'package:flutter/material.dart';
import 'package:kainato_portfolio/core/enum/assets.dart';
import 'package:kainato_portfolio/core/enum/hard_skill.dart';
import 'package:kainato_portfolio/core/enum/soft_skill.dart';
import 'package:kainato_portfolio/core/routes/kp_routes.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/extension/context_extension.dart';
import '../../widgets/base/section_tile.dart';
import '../../widgets/base/skill_chip.dart';
import '../../widgets/dialogs/kp_alert_dialog.dart';
import '../../widgets/layout/kp_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return KpScaffold(
      route: KpRoutes.home,
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
          SectionHeaderTile(title: 'Hard-skills', icon: Icons.code),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: HardSkill.values
                .map(
                  (skill) => SkillChip(
                    label: skill.name,
                    labelColor: skill.onColor,
                    hoverColor: skill.color,
                    onTap: () async {
                      await showKpAlertDialog(
                        context: context,
                        title: 'Abrir link externo',
                        content:
                            'Você será redirecionado para ${skill.name}. Deseja continuar?',
                        icon: Icons.open_in_new,
                        confirmLabel: 'Abrir',
                        cancelLabel: 'Cancelar',
                        onConfirm: () async {
                          await launchUrl(Uri.parse(skill.link));
                        },
                      );
                    },
                  ),
                )
                .toList(),
          ),
          SectionHeaderTile(title: 'Soft-skills', icon: Icons.book),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
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
