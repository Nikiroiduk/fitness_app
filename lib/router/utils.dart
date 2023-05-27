enum Pages {
  splash,
  settings,
  auth,
  home,
}

extension AppPagesExtension on Pages {
  String get path {
    switch (this) {
      case Pages.splash:
        return '/splash';
      case Pages.auth:
        return '/auth';
      case Pages.settings:
        return 'settings';
      case Pages.home:
        return '/home';
      default:
        return '/';
    }
  }

  String get name {
    switch (this) {
      case Pages.splash:
        return 'splash';
      case Pages.auth:
        return 'auth';
      case Pages.settings:
        return 'settings';
      case Pages.home:
        return 'home';
      default:
        return '';
    }
  }

  String get title {
    switch (this) {
      case Pages.splash:
        return 'Splash';
      case Pages.auth:
        return 'Auth';
      case Pages.settings:
        return 'Settings';
      case Pages.home:
        return 'Home';
      default:
        return '';
    }
  }
}
