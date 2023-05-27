import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global_providers.dart';

final preferences = Provider(
  (ref) => Preferences(
    sharedPreferences: ref.watch(sharedPreferences),
  ),
);

class Preferences {
  final SharedPreferences sharedPreferences;

  Preferences({required this.sharedPreferences});

  authRemove(String key) => sharedPreferences.remove(key);
  authSet(String key, String value) => sharedPreferences.setString(key, value);
  authGet(String key) => sharedPreferences.getString(key);

  persistThemeMode(ThemeMode mode) =>
      sharedPreferences.setString('themeMode', mode.toString());

  ThemeMode get themeMode => ThemeMode.values.firstWhere(
        (element) =>
            element.toString() == sharedPreferences.getString('themeMode'),
        orElse: () => ThemeMode.system,
      );
}
