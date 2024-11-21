import 'package:flutter/material.dart';

/// Uygulama genelinde kullanılan sabit değerler
abstract class AppConstants {
  // App Info
  static const String appName = 'Imageify AI';
  static const String appVersion = '1.0.0';
  static const String buildNumber = '1';

  // Storage Keys
  static const String themeKey = 'theme_mode';
  static const String languageKey = 'language';

  // AI Settings
  static const int defaultStepCount = 30;
  static const double defaultGuidanceScale = 7.5;
  static const int minStepCount = 20;
  static const int maxStepCount = 50;
  static const double minGuidanceScale = 1.0;
  static const double maxGuidanceScale = 20.0;

  // UI Constants
  static const double drawerWidth = 320;
  static const double headerHeight = 180;
  static const double cardBorderRadius = 16;
  static const EdgeInsets paddingAllMd = EdgeInsets.all(16);
  static const EdgeInsets paddingAllSm = EdgeInsets.all(8);
  static const EdgeInsets paddingAllLg = EdgeInsets.all(24);
}
