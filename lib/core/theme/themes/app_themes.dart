import 'package:flutter/material.dart';
import 'light_theme.dart';
import 'dark_theme.dart';

class AppThemes {
  AppThemes._();

  static ThemeData get light => lightTheme;
  static ThemeData get dark => darkTheme;
}
