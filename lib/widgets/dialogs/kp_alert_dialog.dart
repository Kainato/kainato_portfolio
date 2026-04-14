import 'package:flutter/material.dart';
import 'package:kainato_portfolio/core/extension/context_extension.dart';

/// Material Design 3 Alert Dialog component
///
/// Componente de diálogo de alerta seguindo os padrões do Material Design
/// fornecido pelo Google. Suporta título, conteúdo, ícone customizado e
/// botões de ação configuráveis.
class KpAlertDialog extends StatelessWidget {
  /// Título do diálogo
  final String? title;

  /// Conteúdo principal do diálogo
  final String? content;

  /// Ícone exibido no topo do diálogo
  final IconData? icon;

  /// Cor do ícone
  final Color? iconColor;

  /// Rótulo do botão de confirmação
  final String confirmLabel;

  /// Rótulo do botão de cancelamento
  final String cancelLabel;

  /// Callback executado ao confirmar
  final VoidCallback? onConfirm;

  /// Callback executado ao cancelar
  final VoidCallback? onCancel;

  /// Define se o diálogo deve fechar ao clicar fora dele
  final bool barrierDismissible;

  const KpAlertDialog({
    super.key,
    this.title,
    this.content,
    this.icon,
    this.iconColor,
    this.confirmLabel = 'Confirmar',
    this.cancelLabel = 'Cancelar',
    this.onConfirm,
    this.onCancel,
    this.barrierDismissible = true,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: icon != null
          ? Icon(icon, color: iconColor ?? context.primaryColor, size: 32.0)
          : null,
      title: title != null ? Text(title!, style: context.headlineSmall) : null,
      content: content != null
          ? Text(content!, style: context.bodyMedium)
          : null,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onCancel?.call();
          },
          child: Text(cancelLabel),
        ),
        FilledButton(
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm?.call();
          },
          child: Text(confirmLabel),
        ),
      ],
    );
  }
}

/// Função auxiliar para mostrar o KpAlertDialog
Future<void> showKpAlertDialog({
  required BuildContext context,
  String? title,
  String? content,
  IconData? icon,
  Color? iconColor,
  String confirmLabel = 'Confirmar',
  String cancelLabel = 'Cancelar',
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
  bool barrierDismissible = true,
}) {
  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) => KpAlertDialog(
      title: title,
      content: content,
      icon: icon,
      iconColor: iconColor,
      confirmLabel: confirmLabel,
      cancelLabel: cancelLabel,
      onConfirm: onConfirm,
      onCancel: onCancel,
      barrierDismissible: barrierDismissible,
    ),
  );
}
