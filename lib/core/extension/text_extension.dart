import 'package:flutter/material.dart';

extension TextExtension on Text {
  Padding padding(EdgeInsetsGeometry value) {
    return Padding(
      padding: value,
      child: this,
    );
  }
}
