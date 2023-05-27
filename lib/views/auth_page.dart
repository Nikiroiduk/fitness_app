import 'package:fitness_app/services/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Auth page'),
          const SizedBox(height: 12),
          ref.watch(authProvider).isLoading ? 
          const CircularProgressIndicator() :
          TextButton(
            // Че хотел тут сделать? Чтобы кнопка отключалась на время загрузки?
              onPressed: () async => ref.watch(authProvider).isLoading
                  ? null
                  : ref.read(authProvider.notifier).login('Name', 'Password'),
              child: const Text('Log in')),
        ],
      )),
    );
  }
}
