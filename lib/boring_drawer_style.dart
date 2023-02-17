import 'package:flutter/widgets.dart';

class BoringDrawerStlye {
  final Color? backgroundColor;
  final BorderRadius drawerRadius;
  final EdgeInsets padding;

  const BoringDrawerStlye({
    this.backgroundColor,
    this.padding = const EdgeInsets.all(0),
    this.drawerRadius = const BorderRadius.all(Radius.circular(16)),
  });
}
