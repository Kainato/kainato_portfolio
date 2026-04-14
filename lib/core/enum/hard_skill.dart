import 'package:flutter/material.dart';

enum HardSkill {
  flutter,
  dart,
  firebase,
  restApi,
  git,
  github,
  figma,
  cloudflare,
  markdown,
  supabase,
  laravel,
  php,
  filament,
  python,
}

extension HardSkillExtension on HardSkill {
  String get name {
    switch (this) {
      case HardSkill.flutter:
        return 'Flutter';
      case HardSkill.dart:
        return 'Dart';
      case HardSkill.firebase:
        return 'Firebase';
      case HardSkill.restApi:
        return 'REST API';
      case HardSkill.git:
        return 'Git';
      case HardSkill.github:
        return 'GitHub';
      case HardSkill.figma:
        return 'Figma';
      case HardSkill.cloudflare:
        return 'Cloudflare';
      case HardSkill.markdown:
        return 'Markdown';
      case HardSkill.supabase:
        return 'Supabase';
      case HardSkill.laravel:
        return 'Laravel';
      case HardSkill.php:
        return 'PHP';
      case HardSkill.filament:
        return 'Filament';
      case HardSkill.python:
        return 'Python';
    }
  }

  Color get color {
    switch (this) {
      case HardSkill.flutter:
        return const Color(0xFF02569B);
      case HardSkill.dart:
        return const Color(0xFF0175C2);
      case HardSkill.firebase:
        return const Color(0xFFFFCA28);
      case HardSkill.restApi:
        return const Color(0xFF6A1B9A);
      case HardSkill.git:
        return const Color(0xFFF05032);
      case HardSkill.github:
        return const Color(0xFF333333);
      case HardSkill.figma:
        return const Color(0xFFF24E1E);
      case HardSkill.cloudflare:
        return const Color(0xFF232F3E);
      case HardSkill.markdown:
        return const Color(0xFF083FA1);
      case HardSkill.supabase:
        return const Color(0xFF3ECF8E);
      case HardSkill.laravel:
        return const Color(0xFFFF2D20);
      case HardSkill.php:
        return const Color(0xFF777BB4);
      case HardSkill.filament:
        return const Color(0xFFE38A01);
      case HardSkill.python:
        return const Color(0xFF3776AB);
    }
  }

  Color get onColor {
    switch (this) {
      case HardSkill.flutter:
        return Colors.white;
      case HardSkill.dart:
        return Colors.white;
      case HardSkill.firebase:
        return Colors.black;
      case HardSkill.restApi:
        return Colors.white;
      case HardSkill.git:
        return Colors.white;
      case HardSkill.github:
        return Colors.white;
      case HardSkill.figma:
        return Colors.white;
      case HardSkill.cloudflare:
        return Colors.white;
      case HardSkill.markdown:
        return Colors.white;
      case HardSkill.supabase:
        return Colors.white;
      case HardSkill.laravel:
        return Colors.white;
      case HardSkill.php:
        return Colors.white;
      case HardSkill.filament:
        return Colors.white;
      case HardSkill.python:
        return Colors.white;
    }
  }

  String get link {
    switch (this) {
      case HardSkill.flutter:
        return 'https://flutter.dev';
      case HardSkill.dart:
        return 'https://dart.dev';
      case HardSkill.firebase:
        return 'https://firebase.google.com';
      case HardSkill.restApi:
        return 'https://restfulapi.net';
      case HardSkill.git:
        return 'https://git-scm.com';
      case HardSkill.github:
        return 'https://github.com';
      case HardSkill.figma:
        return 'https://www.figma.com';
      case HardSkill.cloudflare:
        return 'https://www.cloudflare.com';
      case HardSkill.markdown:
        return 'https://www.markdownguide.org';
      case HardSkill.supabase:
        return 'https://supabase.com';
      case HardSkill.laravel:
        return 'https://laravel.com';
      case HardSkill.php:
        return 'https://www.php.net';
      case HardSkill.filament:
        return 'https://filamentphp.com';
      case HardSkill.python:
        return 'https://www.python.org';
    }
  }
}
