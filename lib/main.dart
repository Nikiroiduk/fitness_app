import 'package:fitness_app/global_providers.dart';
import 'package:fitness_app/router/router_provider.dart';
import 'package:fitness_app/views/settings/themes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  // SharedPreferences initialization
  WidgetsFlutterBinding.ensureInitialized();
  await initGlobalProviders();

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => MaterialApp.router(
        theme: ref.watch(theme),
        darkTheme: ref.watch(darkTheme),
        themeMode: ref.watch(themeMode),
        routerConfig: ref.watch(goRouterProvider),
      ),
    );
  }
}
