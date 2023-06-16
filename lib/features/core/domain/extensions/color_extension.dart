import 'package:flutter/material.dart';

extension ColorExtension on Color {
  static const _hex = 16;
  static const _charsToRemove = 2;

  String toHex() =>
      '#${value.toRadixString(_hex).substring(_charsToRemove).toUpperCase()}';
}
