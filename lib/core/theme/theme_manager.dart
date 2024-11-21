import 'package:flutter/material.dart';
import 'package:imageifyai/core/services/storage_service.dart';

import 'app_theme.dart';

class ThemeManager extends ChangeNotifier {
  bool _isDark = StorageService.getTheme();

  bool get isDark => _isDark;
  ThemeData get theme => _isDark ? AppTheme.dark : AppTheme.light;

  void toggleTheme() {
    _isDark = !_isDark;
    StorageService.setTheme(_isDark);
    notifyListeners();
  }
}
