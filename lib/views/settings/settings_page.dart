
import 'package:fitness_app/views/settings/themes.dart';
import 'package:fitness_app/views/settings/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         ref.read(authProvider.notifier).logout();
        //       },
        //       icon: const Icon(Icons.logout_rounded))
        // ],
        title: const Text('Settings'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: Themes.values.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(Themes.values[index].title),
                  trailing: ref.watch(themeMode) == Themes.values[index].theme
                      ? const Icon(Icons.check)
                      : null,
                  onTap: () {
                    ref
                        .read(themeMode.notifier)
                        .toggle(Themes.values[index]);
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
