import 'package:flutter/material.dart';
import 'package:imageifyai/core/theme/app_theme.dart';
import 'package:imageifyai/core/theme/cyberpunk/cyberpunk_theme.dart';

class ThemeManager extends ChangeNotifier {
  final _cyberpunkTheme = CyberpunkTheme.instance;
  bool _isDark = true;

  bool get isDark => _isDark;
  ThemeData get currentTheme => _isDark ? AppTheme.darkTheme : AppTheme.lightTheme;
  CyberpunkTheme get cyberpunkTheme => _cyberpunkTheme;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  void setCyberpunkStyle(CyberpunkStyle style) {
    _cyberpunkTheme.setStyle(style);
    notifyListeners();
  }
}
