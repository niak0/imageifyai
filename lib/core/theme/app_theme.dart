import 'package:flutter/material.dart';
import '../../product/tokens/colors.dart';

abstract class AppTheme {
  static ThemeData get dark => ThemeData.dark().copyWith(
        // Ana Tema Renkleri
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

        // AppBar Teması
        // appBarTheme: const AppBarTheme(
        //   elevation: 0,
        //   centerTitle: true,
        //   backgroundColor: Colors.transparent,
        //   titleTextStyle: TextStyle(
        //     fontSize: 24,
        //     fontWeight: FontWeight.bold,
        //     color: AppColors.text,
        //   ),
        //   iconTheme: IconThemeData(
        //     color: AppColors.text,
        //   ),
        // ),

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

  static ThemeData get light => ThemeData.light().copyWith(
      // Light tema ayarları
      );
}
