import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../styles/button_styles.dart';

abstract class AppTheme {
  static ThemeData get dark {
    final base = ThemeData.dark();

    return base.copyWith(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyles.primary(),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyles.text(),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyles.secondary(),
      ),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
        onPrimary: AppColors.text,
        onSecondary: AppColors.text,
        onSurface: AppColors.text,
      ),
      textTheme: base.textTheme.copyWith(
        headlineLarge: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.text,
        ),
        headlineMedium: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.text,
        ),
        bodyLarge: const TextStyle(
          fontSize: 16,
          color: AppColors.text,
        ),
        bodyMedium: const TextStyle(
          fontSize: 14,
          color: AppColors.text,
        ),
        bodySmall: const TextStyle(
          fontSize: 12,
          color: AppColors.textLow,
        ),
      ),
      appBarTheme: base.appBarTheme.copyWith(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.text,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.text,
        ),
      ),
    );
  }

  static ThemeData get light {
    final base = ThemeData.light();
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.background,
      // Light tema için de aynı buton stillerini kullan
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyles.primary(),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyles.text(),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyles.secondary(),
      ),
      // Diğer light tema ayarları...
    );
  }
}
