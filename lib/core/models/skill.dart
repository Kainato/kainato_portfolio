import 'package:flutter/material.dart';

/// Representa uma tecnologia/habilidade técnica exibida como chip no portfólio.
class Skill {
  final String name;
  final Color color;
  final Color onColor;
  final String url;

  const Skill({
    required this.name,
    required this.color,
    this.onColor = Colors.white,
    required this.url,
  });
}
