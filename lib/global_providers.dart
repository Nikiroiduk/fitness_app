import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final Provider<SharedPreferences> sharedPreferences;

Future<void> initGlobalProviders() async {
  final sharedPreferencesInstance = await SharedPreferences.getInstance();
  sharedPreferences = Provider((_) => sharedPreferencesInstance);
}
