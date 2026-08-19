import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false; // Default: Light mode
  static const String _themeKey = 'is_dark_mode';

  bool get isDarkMode => _isDarkMode;
  ThemeData get themeData => _isDarkMode ? _darkTheme : _lightTheme;

  // Called once before runApp — no white flash
  Future<void> loadTheme() async {
    final saved = await DatabaseHelper.instance.getSetting(_themeKey);
    if (saved != null) {
      _isDarkMode = saved == 'true';
    }
    // No saved value = keep default false (light mode)
  }

  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    await DatabaseHelper.instance.saveSetting(_themeKey, _isDarkMode.toString());
    notifyListeners();
  }

  static final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    useMaterial3: true,
  );

  static final _lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    useMaterial3: true,
  );
}
