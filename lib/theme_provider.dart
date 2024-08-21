import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'themes.dart';

class ThemeProvider with ChangeNotifier {
  static const String _themeKey = 'themeKey';

  ThemeData _currentTheme = lightTheme;

  ThemeData get currentTheme => _currentTheme;

  ThemeProvider() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString(_themeKey) ?? 'light';

    switch (theme) {
      case 'dark':
        _currentTheme = darkTheme;
        break;
      case 'custom':
        _currentTheme = customTheme;
        break;
      default:
        _currentTheme = lightTheme;
    }

    notifyListeners();
  }

  Future<void> setTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, theme);

    switch (theme) {
      case 'dark':
        _currentTheme = darkTheme;
        break;
      case 'custom':
        _currentTheme = customTheme;
        break;
      default:
        _currentTheme = lightTheme;
    }

    notifyListeners();
  }

  Future<void> resetToDefault() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_themeKey);

    _currentTheme = lightTheme;
    notifyListeners();
  }
}
