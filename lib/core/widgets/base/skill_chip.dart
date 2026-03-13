import 'package:flutter/material.dart';
import 'package:kainato_portfolio/core/extension/context_extension.dart';

class SkillChip extends StatefulWidget {
  final String label;
  final Color labelColor;
  final Color hoverColor;
  final Widget? avatar;

  const SkillChip({
    super.key,
    required this.label,
    required this.labelColor,
    required this.hoverColor,
    this.avatar,
  });

  @override
  State<SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  String get label => widget.label;
  Color get labelColor => widget.labelColor;
  Color get hoverColor => widget.hoverColor;
  Widget? get avatar => widget.avatar;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: !_isHovered ? context.onSurfaceColor : labelColor,
          ),
        ),
        backgroundColor: _isHovered ? hoverColor : Colors.transparent,
        avatar: avatar,
      ),
    );
  }
}
