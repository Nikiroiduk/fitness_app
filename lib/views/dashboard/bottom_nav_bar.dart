import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../router/utils.dart';
import 'dashboard_provider.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return BottomNavigationBar(
          currentIndex: ref.watch(dashboardProvider),
          selectedItemColor: Colors.amber,
          onTap: (index) => _onTap(index),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.text_snippet_rounded), label: 'Test'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        );
      },
    );
  }

  _onTap(index) {
    ref.read(dashboardProvider.notifier).setValue(index);

    switch (index) {
      case 0:
        context.goNamed(Screens.test.name);
        break;
      case 1:
        context.goNamed(Screens.home.name);
        break;
    }
  }
}
