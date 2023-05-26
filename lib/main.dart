import 'package:fitness_app/global_providers.dart';
import 'package:fitness_app/themes.dart';
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
      // Every theme change will fully rebuild app UI
      builder: (context, ref, child) => MaterialApp(
        theme: ref.watch(theme),
        darkTheme: ref.watch(darkTheme),
        themeMode: ref.watch(themeMode),
        home: const HomePage(),
      ),
    );
  }
}

final themes = [ThemeMode.light, ThemeMode.dark, ThemeMode.system];

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meh'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: themes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(themes[index].name),
                  trailing: ref.watch(themeMode).name == themes[index].name
                      ? const Icon(Icons.check)
                      : null,
                  onTap: () {
                    ref.read(themeMode.notifier).toggle(themes[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
