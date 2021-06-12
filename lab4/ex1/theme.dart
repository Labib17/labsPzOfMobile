import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  accentColor: Colors.indigo,
  scaffoldBackgroundColor: Colors.white,
);

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.pink,
  accentColor: Colors.pink,
  scaffoldBackgroundColor: Colors.black,
);

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  late SharedPreferences _prefs;
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  ThemeNotifier() {
    _loadFromPrefs();
  }

  Future<void> toggleTheme() async {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  Future<void> _initPrefs() async {
    SharedPreferences.getInstance().then((preferences){_prefs = preferences;});
  }

  _loadFromPrefs() async {
    _initPrefs();
    _darkTheme = _prefs.getBool(key) ?? false; //if _prefs.getBool(key) returns null, set false
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs(); //Обробка Future результату за допомогою ключового слова await
    _prefs.setBool(key, _darkTheme);
  }

}
