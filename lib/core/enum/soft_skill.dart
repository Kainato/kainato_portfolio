@Deprecated("This enum is deprecated. Update the new design.")

import 'package:flutter/material.dart';

enum SoftSkill {
  resolucaoProblema,
  autonomia,
  aprendizadoRapido,
  pensamentoCritico,
  comunicacao,
  trabalhoEquipe,
  lideranca,
}

extension SoftSkillExtension on SoftSkill {
  String get name {
    switch (this) {
      case SoftSkill.resolucaoProblema:
        return 'Resolução de Problemas';
      case SoftSkill.autonomia:
        return 'Autonomia';
      case SoftSkill.aprendizadoRapido:
        return 'Aprendizado Rápido';
      case SoftSkill.pensamentoCritico:
        return 'Pensamento Crítico';
      case SoftSkill.comunicacao:
        return 'Comunicação';
      case SoftSkill.trabalhoEquipe:
        return 'Trabalho em Equipe';
      case SoftSkill.lideranca:
        return 'Liderança';
    }
  }

  IconData get icon {
    switch (this) {
      case SoftSkill.resolucaoProblema:
        return Icons.build;
      case SoftSkill.autonomia:
        return Icons.self_improvement;
      case SoftSkill.aprendizadoRapido:
        return Icons.flash_on;
      case SoftSkill.pensamentoCritico:
        return Icons.psychology;
      case SoftSkill.comunicacao:
        return Icons.chat_bubble_outline;
      case SoftSkill.trabalhoEquipe:
        return Icons.group_work;
      case SoftSkill.lideranca:
        return Icons.leaderboard;
    }
  }
}
