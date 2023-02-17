import 'package:flutter/material.dart';

class BoringDrawerTileStyle {
  final BorderRadius tileRadius;
  final double tileSpacing;
  final Color selectedColor;
  final String? fontFamily;
  final double? fontSize;
  final TextStyle labelTextStlye;
  final Color? selectedTextColor;
  final Color? unSelectedTextColor;

  const BoringDrawerTileStyle({
    this.tileRadius = const BorderRadius.all(
      Radius.circular(12.0),
    ),
    this.tileSpacing = 10,
    this.selectedColor = Colors.green,
    this.labelTextStlye = const TextStyle(),
    this.selectedTextColor,
    this.fontFamily,
    this.fontSize,
    this.unSelectedTextColor,
  });
}
