import 'package:flutter/material.dart';
import '../tokens/colors.dart';

abstract class AppTheme {
  static ThemeData get dark {
    final base = ThemeData.dark(); // Önce base theme'i alalım
    return base.copyWith(
      primaryColor: AppColors.primary,
      // scaffoldBackgroundColor: AppColors.primaryBackground,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
        onPrimary: AppColors.text,
        onSecondary: AppColors.text,
        onSurface: AppColors.text,
      ),

      // Base theme'in text theme'ini extend edelim
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

      // Base theme'in primary text theme'ini extend edelim
      primaryTextTheme: base.primaryTextTheme.copyWith(
        titleLarge: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.text,
        ),
      ),
      // Base theme'in appBar theme'ini extend edelim
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
        // Light tema ayarları benzer şekilde...
        );
  }
}
