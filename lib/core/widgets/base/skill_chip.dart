import 'package:flutter/material.dart';
import 'package:kainato_portfolio/core/extension/context_extension.dart';

import '../../enum/hard_skill.dart';

class SkillChip extends StatefulWidget {
  final HardSkill skill;

  const SkillChip({super.key, required this.skill});

  @override
  State<SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  String get skillName => widget.skill.name;
  Color get skillColor => widget.skill.color;
  Color get skillOnColor => widget.skill.onColor;

  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Chip(
        label: Text(
          skillName,
          style: TextStyle(
            color: !_isHovered ? context.onSurfaceColor : skillOnColor,
          ),
        ),
        backgroundColor: _isHovered ? skillColor : Colors.transparent,
      ),
    );
  }
}
