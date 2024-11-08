import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/color_constants.dart';
import 'app_tokens.dart';

/// Uygulama genelinde kullanılan stil tanımlamaları
class AppStyles {
  /// Card Stilleri
  static BoxDecoration get cardDecoration => BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppTokens.radiusMd),
        border: Border.all(color: AppColors.outline.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withOpacity(0.08),
            blurRadius: AppTokens.elevationSm,
            offset: const Offset(0, 2),
          ),
        ],
      );

  static BoxDecoration get activeCardDecoration => cardDecoration.copyWith(
        border: Border.all(color: AppColors.primary),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.15),
            blurRadius: AppTokens.elevationMd,
            offset: const Offset(0, 4),
          ),
        ],
      );

  /// Input Stilleri
  static InputDecoration get inputDecoration => InputDecoration(
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusMd),
          borderSide: BorderSide(color: AppColors.outline.withOpacity(0.1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusMd),
          borderSide: BorderSide(color: AppColors.outline.withOpacity(0.1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusMd),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusMd),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppTokens.elevationMd,
          vertical: AppTokens.elevationSm,
        ),
      );

  /// Button Stilleri
  static ButtonStyle get primaryButtonStyle => ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        padding: const EdgeInsets.symmetric(
          horizontal: AppTokens.elevationLg,
          vertical: AppTokens.elevationSm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusMd),
        ),
        elevation: 0,
      );

  static ButtonStyle get secondaryButtonStyle => ElevatedButton.styleFrom(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(
          horizontal: AppTokens.elevationMd,
          vertical: AppTokens.elevationSm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusMd),
          side: BorderSide(color: AppColors.primary.withOpacity(0.5)),
        ),
        elevation: 0,
      );
  static ButtonStyle get outlinedButtonStyle => OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary),
        padding: const EdgeInsets.symmetric(
          horizontal: AppTokens.elevationLg,
          vertical: AppTokens.elevationMd,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusMd),
        ),
      );

  static ButtonStyle get textButtonStyle => TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(
          horizontal: AppTokens.elevationMd,
          vertical: AppTokens.elevationSm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusSm),
        ),
      );

  static ButtonStyle get iconButtonStyle => IconButton.styleFrom(
        foregroundColor: AppColors.primary,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(AppTokens.elevationSm),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusSm),
        ),
      );

  /// Container Stilleri
  static BoxDecoration get gradientContainerDecoration => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary,
            AppColors.primary.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(AppTokens.radiusMd),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.25),
            blurRadius: AppTokens.elevationLg,
            offset: const Offset(0, 8),
          ),
        ],
      );

  static BoxDecoration get glassContainerDecoration => BoxDecoration(
        color: AppColors.surface.withOpacity(0.8),
        borderRadius: BorderRadius.circular(AppTokens.radiusMd),
        border: Border.all(
          color: AppColors.outline.withOpacity(0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withOpacity(0.05),
            blurRadius: AppTokens.elevationSm,
          ),
        ],
      );

  /// Modal ve Bottom Sheet Stilleri
  static BoxDecoration get modalDecoration => BoxDecoration(
        color: AppColors.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppTokens.radiusLg),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withOpacity(0.1),
            blurRadius: AppTokens.elevationLg,
            offset: const Offset(0, -4),
          ),
        ],
      );

  /// List Tile Stilleri
  static ListTileThemeData get listTileTheme => ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusSm),
        ),
        selectedTileColor: AppColors.primary.withOpacity(0.1),
        selectedColor: AppColors.primary,
      );

  /// Chip Stilleri
  static ChipThemeData get chipTheme => ChipThemeData(
        backgroundColor: AppColors.surface,
        selectedColor: AppColors.primary.withOpacity(0.2),
        labelStyle: const TextStyle(fontSize: 14),
        padding: const EdgeInsets.symmetric(
          horizontal: AppTokens.elevationSm,
          vertical: AppTokens.elevationXs,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusSm),
          side: BorderSide(color: AppColors.outline.withOpacity(0.1)),
        ),
      );

  /// Progress Indicator Stilleri
  static BoxDecoration get progressIndicatorDecoration => BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppTokens.radiusXl),
        border: Border.all(
          color: AppColors.outline.withOpacity(0.1),
        ),
      );

  /// Image Container Stilleri
  static BoxDecoration get imageContainerDecoration => BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppTokens.radiusMd),
        border: Border.all(
          color: AppColors.outline.withOpacity(0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withOpacity(0.08),
            blurRadius: AppTokens.elevationMd,
            offset: const Offset(0, 4),
          ),
        ],
      );
}
