enum Screens {
  splash,
  settings,
  auth,
  home,
  test,
}

extension AppPagesExtension on Screens {
  String get path {
    switch (this) {
      case Screens.splash:
        return '/splash';
      case Screens.auth:
        return '/auth';
      case Screens.settings:
        return 'settings';
      case Screens.home:
        return '/home';
      case Screens.test:
        return '/test';
      default:
        return '/';
    }
  }

  String get name {
    switch (this) {
      case Screens.splash:
        return 'splash';
      case Screens.auth:
        return 'auth';
      case Screens.settings:
        return 'settings';
      case Screens.home:
        return 'home';
      case Screens.test:
        return 'test';
      default:
        return '';
    }
  }

  String get title {
    switch (this) {
      case Screens.splash:
        return 'Splash';
      case Screens.auth:
        return 'Auth';
      case Screens.settings:
        return 'Settings';
      case Screens.home:
        return 'Home';
      case Screens.test:
        return 'Test';
      default:
        return '';
    }
  }
}
