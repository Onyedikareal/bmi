import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStateManager extends ChangeNotifier {
  static const appThemeState = 'appThemeState';
  bool _isLightTheme = false;

  bool get isLightTheme => _isLightTheme;

  set setAppThemeState(bool isLightTheme) {
    _isLightTheme = isLightTheme;
    notifyListeners();
  }

  final SharedPreferences prefs;
  AppStateManager({required this.prefs});

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
