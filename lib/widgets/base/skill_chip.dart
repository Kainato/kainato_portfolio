import 'package:flutter/material.dart';
import 'package:kainato_portfolio/core/extension/context_extension.dart';

class SkillChip extends StatefulWidget {
  final String label;
  final Color? labelColor;
  final Color? hoverColor;
  final Widget? avatar;
  final VoidCallback? onTap;

  const SkillChip({
    super.key,
    required this.label,
    this.labelColor,
    this.hoverColor,
    this.avatar,
    this.onTap,
  });

  @override
  State<SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  String get label => widget.label;
  Color get labelColor => widget.labelColor ?? context.onSurfaceColor;
  Color get hoverColor => widget.hoverColor ?? Colors.transparent;
  Widget? get avatar => widget.avatar;
  VoidCallback? get onTap => widget.onTap;
  bool get isClickable => onTap != null;
  bool _isHovered = false;
  MouseCursor get mouseCursor =>
      isClickable ? SystemMouseCursors.click : MouseCursor.defer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Chip(
          mouseCursor: mouseCursor,
          label: Text(
            label,
            style: TextStyle(
              color: _isHovered ? labelColor : context.onSurfaceColor,
            ),
          ),
          backgroundColor: _isHovered ? hoverColor : Colors.transparent,
          avatar: avatar,
        ),
      ),
    );
  }
}
