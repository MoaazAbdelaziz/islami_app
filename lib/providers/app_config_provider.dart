import 'package:flutter/material.dart';
import 'package:islami_app/shared_pref.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;

  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      CacheHelper.setData(key: 'language', value: appLanguage);
      return;
    } else {
      appLanguage = newLanguage;
      CacheHelper.setData(key: 'language', value: newLanguage);
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
