import 'package:flutter/material.dart';

/// Uygulama yapılandırma ayarları
class AppConfig {
  // Uygulama bilgileri
  static const String appName = 'Imageify AI';
  static const String appVersion = '1.0.0';
  static const String buildNumber = '1';

  // Ortam ayarları
  static const Environment environment = Environment.development;
  static bool get isDevelopment => environment == Environment.development;
  static bool get isProduction => environment == Environment.production;

  // API ayarları
  static String get apiBaseUrl => isDevelopment ? 'https://dev-api.imageifyai.com' : 'https://api.imageifyai.com';
  static const Duration apiTimeout = Duration(seconds: 30);
  static const int maxRetryAttempts = 3;

  // Cache ayarları
  static const Duration defaultCacheAge = Duration(hours: 1);
  static const int maxCacheSize = 50 * 1024 * 1024; // 50MB

  // AI Ayarları
  static const int defaultStepCount = 30;
  static const double defaultGuidanceScale = 7.5;
  static const int minStepCount = 20;
  static const int maxStepCount = 50;
  static const double minGuidanceScale = 1.0;
  static const double maxGuidanceScale = 20.0;

  // Storage Keys
  static const String themeKey = 'theme_mode';
  static const String languageKey = 'language';

  // UI Constants
  static const double drawerWidth = 320;
  static const double headerHeight = 180;
  static const double cardBorderRadius = 16;
  static const EdgeInsets paddingAllMd = EdgeInsets.all(16);

  // Feature flags
  static const bool enableAnalytics = true;
  static const bool enableCrashReporting = true;
  static const bool enablePushNotifications = false;
}

enum Environment {
  development,
  staging,
  production,
}
