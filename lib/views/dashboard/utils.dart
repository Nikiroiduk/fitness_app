import 'package:flutter/material.dart';

import '../error_screen.dart';
import '../home_page.dart';
import '../test_page.dart';

enum Pages {
  profile,
  test,
}

extension PagesX on Pages {
  Widget get page {
    switch (this) {
      case Pages.profile:
        return const HomePage();
      case Pages.test:
        return const TestPage();
      default:
        return const ErrorScreen();
    }
  }
}
