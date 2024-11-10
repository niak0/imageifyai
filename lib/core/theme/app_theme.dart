import 'package:flutter/material.dart';
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

  // Dekorasyon Yardımcıları
  BoxDecoration getDecoration({Color? color, double? intensity}) {
    color ??= AppColors.primary;
    intensity ??= neonIntensity;

    switch (_style) {
      case ThemeStyle.glass:
        return _glassDecoration(color);
      case ThemeStyle.neon:
        return _neonDecoration(color, intensity);
      case ThemeStyle.gradient:
        return _gradientDecoration(color);
      case ThemeStyle.minimal:
        return _minimalDecoration(color);
    }
  }

  // Dekorasyon Metodları
  BoxDecoration _glassDecoration(Color color) {
    return BoxDecoration(
      color: AppColors.surface.withOpacity(0.95),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: color.withOpacity(AppColors.borderOpacity),
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(AppColors.glowOpacity),
          blurRadius: glassBlur,
          spreadRadius: 0,
        ),
      ],
    );
  }

  BoxDecoration _neonDecoration(Color color, double intensity) {
    return BoxDecoration(
      color: AppColors.surface.withOpacity(0.95),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: color.withOpacity(intensity),
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(intensity * 0.4),
          blurRadius: 8,
          spreadRadius: 1,
        ),
      ],
    );
  }

  BoxDecoration _gradientDecoration(Color color) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          AppColors.surface.withOpacity(0.95),
          color.withOpacity(gradientOpacity),
        ],
      ),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: color.withOpacity(0.3),
        width: 1,
      ),
    );
  }

  BoxDecoration _minimalDecoration(Color color) {
    return BoxDecoration(
      color: AppColors.surface.withOpacity(0.95),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: color.withOpacity(0.1),
        width: 1,
      ),
    );
  }

  static BoxDecoration glassDecoration({
    Color? color,
    double opacity = 0.1,
    double borderOpacity = 0.2,
  }) {
    final effectiveColor = color ?? AppColors.primary;
    return BoxDecoration(
      color: AppColors.surface.withOpacity(0.95),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: effectiveColor.withOpacity(borderOpacity),
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: effectiveColor.withOpacity(opacity),
          blurRadius: 8,
          spreadRadius: 0,
        ),
      ],
    );
  }

  static BoxDecoration neonDecoration({
    Color? color,
    double intensity = 0.5,
  }) {
    final effectiveColor = color ?? AppColors.primary;
    return BoxDecoration(
      color: AppColors.surface.withOpacity(0.95),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: effectiveColor.withOpacity(intensity),
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: effectiveColor.withOpacity(intensity * 0.4),
          blurRadius: 8,
          spreadRadius: 1,
        ),
      ],
    );
  }

  // Ana Tema Metodları
  ThemeData get theme => _isDark ? darkTheme : lightTheme;

  static ThemeData get darkTheme {
    return ThemeData(
      // Ana Tema Renkleri
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.primary,
        surface: AppColors.surface,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.textPrimary,
      ),

      // AppBar Teması
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        iconTheme: IconThemeData(
          color: AppColors.textPrimary,
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
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColors.primary.withOpacity(0.1),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColors.primary.withOpacity(0.1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: AppColors.primary,
          ),
        ),
      ),

      // Metin Teması
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: AppColors.textPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: AppColors.textPrimary,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: AppColors.textSecondary,
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
