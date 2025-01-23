import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//step 1
class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  void changeAppTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    saveTheme(newTheme);  
    notifyListeners();
  }

  bool isSelectedLight() {
    return currentTheme == ThemeMode.light;
  }

   
  void saveTheme(ThemeMode themeMode) async {
    SharedPreferences prefs =
        await SharedPreferences.getInstance();  
    if (themeMode == ThemeMode.light) {
      prefs.setString('theme', 'light');
    } else {
      prefs.setString('theme', 'dark');
    }
  }

 
  void getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String theme = prefs.getString('theme') ?? '';
    if (theme == 'light') {
      currentTheme = ThemeMode.light;
    } else {
      currentTheme = ThemeMode.dark;
    }
    notifyListeners();
  }
}