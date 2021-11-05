import 'package:ecommerce_app/models/dark_theme_prefrence.dart';
import 'package:flutter/material.dart';

class DarkThemeProvider extends ChangeNotifier {
  DarkThemePrefrences darkThemePrefrences = DarkThemePrefrences();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;
  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePrefrences.setDarkTheme(value);
    notifyListeners();
  }
}
