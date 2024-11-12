import 'package:flutter/material.dart';

import 'app_theme.dart';

class ThemeManager extends ChangeNotifier {
  bool _isDark = true;

  bool get isDark => _isDark;
  ThemeData get theme => _isDark ? AppTheme.dark : AppTheme.light;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
