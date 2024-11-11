import 'package:flutter/material.dart';
import 'package:imageifyai/core/theme/app_tokens.dart';
import '../constants/color_constants.dart';

enum ThemeStyle {
  glass, // Cam efekti
  neon, // Neon kenarlıklar
  gradient, // Gradient arka plan
  minimal // Basit stil
}

class AppTheme {
  static final AppTheme instance = AppTheme._();
  AppTheme._();

  // Tema Durumu
  bool _isDark = true;
  ThemeStyle _style = ThemeStyle.neon;

  // Getters
  bool get isDark => _isDark;
  ThemeStyle get style => _style;

  // Tema Ayarları
  double glassBlur = 10.0;
  double neonIntensity = 0.5;
  double gradientOpacity = 0.1;

  // Setters
  void setDarkMode(bool value) => _isDark = value;
  void setStyle(ThemeStyle value) => _style = value;

  // Ana Tema Metodları
  ThemeData get theme => _isDark ? darkTheme : lightTheme;

  static ThemeData get darkTheme {
    return ThemeData(
      // Ana Tema Renkleri
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.primaryBackground,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.primary,
        surface: AppColors.surface,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.text,
      ),

      // AppBar Teması
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.text,
        ),
        iconTheme: IconThemeData(
          color: AppColors.text,
        ),
      ),

      // Buton Teması
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Card Teması
      cardTheme: CardTheme(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: AppColors.primary.withOpacity(0.1),
          ),
        ),
      ),

      // Input Dekorasyon Teması
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusMd),
          borderSide: BorderSide(
            color: AppColors.outline.withOpacity(0.1),
          ),
        ),
        // ... diğer border stilleri benzer şekilde
      ),

      // Metin Teması
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.text,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.text,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: AppColors.text,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: AppColors.text,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: AppColors.textLow,
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
        // Light Theme
        );
  }
}
