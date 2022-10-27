import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  static const appThemeState = 'appThemeState';
  final SharedPreferences prefs;
  AppCache({required this.prefs});

  cacheAppThemeState({required bool? isLightTheme}) async {
    if (isLightTheme == null) {
      prefs.remove(appThemeState);
    } else {
      prefs.setBool(appThemeState, isLightTheme);
    }
  }

  bool getCachedAppThemeState() {
    return prefs.getBool(appThemeState) ?? false;
  }
}
