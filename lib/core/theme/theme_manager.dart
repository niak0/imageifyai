import 'package:flutter/material.dart';
import 'package:imageifyai/core/theme/app_theme.dart';

class ThemeManager extends ChangeNotifier {
  static final ThemeManager _instance = ThemeManager._();
  static ThemeManager get instance => _instance;
  ThemeManager._();

  final _appTheme = AppTheme.instance;

  // Getters
  ThemeData get theme => _appTheme.theme;
  bool get isDark => _appTheme.isDark;
  ThemeStyle get currentStyle => _appTheme.style;

  // Tema Değiştirme Metodları
  void toggleDarkMode() {
    _appTheme.setDarkMode(!_appTheme.isDark);
    notifyListeners();
  }

  void setStyle(ThemeStyle style) {
    _appTheme.setStyle(style);
    notifyListeners();
  }

  void setDarkMode(bool isDark) {
    _appTheme.setDarkMode(isDark);
    notifyListeners();
  }

  // Tema Ayarları
  void setNeonIntensity(double value) {
    _appTheme.neonIntensity = value;
    notifyListeners();
  }

  void setGlassBlur(double value) {
    _appTheme.glassBlur = value;
    notifyListeners();
  }

  void setGradientOpacity(double value) {
    _appTheme.gradientOpacity = value;
    notifyListeners();
  }
}
