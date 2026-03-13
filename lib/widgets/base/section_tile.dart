import 'package:flutter/material.dart';
import 'package:kainato_portfolio/core/extension/context_extension.dart';

class SectionHeaderTile extends StatelessWidget {
  final String title;
  final IconData icon;
  const SectionHeaderTile({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(16.0),
      title: Text(
        title,
        style: context.headlineMedium?.copyWith(
          color: context.onInverseSurface,
        ),
      ),
      trailing: Icon(icon, color: context.onInverseSurface),
      tileColor: context.inverseSurface,
    );
  }
}
