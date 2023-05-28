import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../services/auth/auth_provider.dart';
import '../views/test_page.dart';
import '../views/views.dart';
import 'utils.dart';

final _key = GlobalKey<NavigatorState>();
final _home = GlobalKey<NavigatorState>();

// TODO: Error route

/* TODO: In web route enetered by hand isn't working 
   actually it work's until routing or dashboard coming
   in and sending user to home page */
final goRouterProvider = Provider<GoRouter>((ref) {
  ref.watch(authProvider);
  final authNotifier = ref.read(authProvider.notifier);
  return GoRouter(
    navigatorKey: _key,
    initialLocation: Screens.splash.path,
    routes: [
      GoRoute(
        path: Screens.splash.path,
        name: Screens.splash.name,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: Screens.auth.path,
        name: Screens.auth.name,
        builder: (context, state) => const AuthScreen(),
      ),
      // TODO: Shell route for dashboard
      ShellRoute(
        navigatorKey: _home,
        builder: (context, state, child) =>
            DashboardScreen(key: state.pageKey, child: child),
        routes: [
          GoRoute(
            path: Screens.test.path,
            name: Screens.test.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: TestPage(),
            ),
          ),
          GoRoute(
            path: Screens.home.path,
            name: Screens.home.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomePage(),
            ),
            routes: [
              GoRoute(
                parentNavigatorKey: _home,
                path: Screens.settings.path,
                name: Screens.settings.name,
                builder: (context, state) => const SettingsPage(),
              ),
            ],
          )
        ],
      ),
      // GoRoute(
      //   path: Pages.home.path,
      //   name: Pages.home.name,
      //   builder: (context, state) => const HomePage(),
      //   routes: [
      //     GoRoute(
      //       path: Pages.settings.path,
      //       name: Pages.settings.name,
      //       builder: (context, state) => const SettingsPage(),
      //     ),
      //   ],
      // )
    ],
    redirect: (context, state) {
      if (authNotifier.isLoading) return null;

      final isAuth = authNotifier.isAuthenticated;

      final isSplash = state.location == Screens.splash.path;
      if (isSplash) {
        return isAuth ? Screens.home.path : Screens.auth.path;
      }

      final isLoggingIn = state.location == Screens.auth.path;
      if (isLoggingIn) return isAuth ? Screens.home.path : null;

      return isAuth ? null : Screens.splash.path;
    },
  );
});
