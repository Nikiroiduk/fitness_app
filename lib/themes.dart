import 'package:fitness_app/preferences.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Themes providers
final theme = Provider((ref) => _theme);
final darkTheme = Provider((ref) => _darkTheme);
final themeMode = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  (ref) => ThemeModeNotifier(
    preferences: ref.watch(preferences),
  ),
);

final _theme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
);

final _darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
);

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  final Preferences preferences;

  ThemeModeNotifier({required this.preferences}) : super(preferences.themeMode);

  // void toggle() {
  //   if (state == ThemeMode.dark) {
  //     preferences.persistThemeMode(ThemeMode.light);
  //     state = ThemeMode.light;
  //   } else {
  //     preferences.persistThemeMode(ThemeMode.dark);
  //     state = ThemeMode.dark;
  //   }
  // }

  void toggle(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        preferences.persistThemeMode(ThemeMode.light);
        state = ThemeMode.light;
        break;
      case ThemeMode.dark:
        preferences.persistThemeMode(ThemeMode.dark);
        state = ThemeMode.dark;
        break;
      case ThemeMode.system:
        preferences.persistThemeMode(ThemeMode.system);
        state = ThemeMode.system;
        break;
    }
  }
}
