import 'package:flutter/material.dart';
import 'package:news_app/core/cashe_helper.dart';

 
class AppConfigProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;
  String applang = CasheHelper.getData(key: 'lang') ?? 'ar';

  AppConfigProvider() {
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    String? savedMode = CasheHelper.getThemeMode();
    if (savedMode != null) {
      appTheme = savedMode == 'dark' ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    }
  }

  Future<void> changeTheme(ThemeMode newMode) async {
    if (appTheme == newMode) {
      return;
    } else {
      appTheme = newMode;
      await CasheHelper.saveThemeMode(newMode == ThemeMode.dark ? 'dark' : 'light');
      notifyListeners();
    }
  }

  Future<void> changeLang(String newLang) async {
    if (applang == newLang) {
      return;
    } else {
      applang = newLang;
      await CasheHelper.saveData(key: 'lang', value: newLang);
      notifyListeners();
    }
  }
}