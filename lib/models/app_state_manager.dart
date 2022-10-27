import 'package:flutter/cupertino.dart';

enum AppThemeState{
  light,
  dark,
  system
}

class AppStateManager extends ChangeNotifier {
  static const appThemeState = 'appThemeState';
  AppThemeState _isLightTheme = AppThemeState.system;

  AppThemeState get isLightTheme => _isLightTheme;

  set setAppThemeState(AppThemeState isLightTheme) {
    _isLightTheme = isLightTheme;
    notifyListeners();
  }


}
