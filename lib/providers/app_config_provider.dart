import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;

  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    } else {
      appLanguage = newLanguage;
    }
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) {
    if (newTheme == appTheme) {
      return;
    } else {
      appTheme = newTheme;
    }
    notifyListeners();
  }
}
