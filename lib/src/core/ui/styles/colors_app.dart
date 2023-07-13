import 'package:flutter/material.dart';

class ColorsApp {
//! unica aplicação no app como todo
  static ColorsApp? _instance;

  ColorsApp._();
  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xFF262D34);
  Color get secondery => const Color(0xFF1D2428);
  Color get black => const Color(0xFF14181B);
}

extension ColorsAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}
