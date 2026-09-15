import 'package:flutter/material.dart';

/// Envolve um card/tile de seção com elevação e escala sutis ao passar o mouse.
class SectionTile extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final String? semanticLabel;

  const SectionTile({
    super.key,
    required this.child,
    this.onTap,
    this.semanticLabel,
  });

  @override
  State<SectionTile> createState() => _SectionTileState();
}

class _SectionTileState extends State<SectionTile> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final content = MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : MouseCursor.defer,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, _hovering ? -4 : 0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: _hovering
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.35),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ]
                : const [],
          ),
          child: widget.child,
        ),
      ),
    );

    if (widget.semanticLabel == null) return content;

    return Semantics(
      button: widget.onTap != null,
      label: widget.semanticLabel,
      child: content,
    );
  }
}
