import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  String local = "en";
  ThemeMode theme = ThemeMode.light;

  changeLanguage(String languageCode) async {
    local = languageCode;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("language", languageCode);
  }

  changeMode(ThemeMode mode) async {
    theme = mode;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("theme", mode == ThemeMode.light ? "light" : "dark");
  }
}
