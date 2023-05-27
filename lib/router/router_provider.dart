import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../services/auth/auth.dart';
import '../views/views.dart';
import 'utils.dart';

final _key = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  ref.watch(authProvider);
  final authNotifier = ref.read(authProvider.notifier);
  return GoRouter(
    navigatorKey: _key,
    initialLocation: Pages.splash.path,
    routes: [
      GoRoute(
        path: Pages.splash.path,
        name: Pages.splash.name,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: Pages.auth.path,
        name: Pages.auth.name,
        builder: (context, state) => const AuthPage(),
      ),
      GoRoute(
        path: Pages.home.path,
        name: Pages.home.name,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: Pages.settings.path,
            name: Pages.settings.name,
            builder: (context, state) => const SettingsPage(),
          ),
        ],
      )
    ],
    redirect: (context, state) {
      if (authNotifier.isLoading) return null;

      final isAuth = authNotifier.isAuthenticated;

      final isSplash = state.location == Pages.splash.path;
      if (isSplash) {
        return isAuth ? Pages.home.path : Pages.auth.path;
      }

      final isLoggingIn = state.location == Pages.auth.path;
      if (isLoggingIn) return isAuth ? Pages.home.path : null;

      return isAuth ? null : Pages.splash.path;
    },
  );
});
