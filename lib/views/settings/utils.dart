import 'package:flutter/material.dart';

enum Themes {
  light,
  dark,
  system,
}

extension ThemeX on Themes {
  ThemeMode get theme {
    switch (this) {
      case Themes.light:
        return ThemeMode.light;
      case Themes.dark:
        return ThemeMode.dark;
      case Themes.system:
        return ThemeMode.system;
    }
  }

  String get title {
    switch (this) {
      case Themes.light:
        return 'Light';
      case Themes.dark:
        return 'Dark';
      case Themes.system:
        return 'System';
    }
  }
}