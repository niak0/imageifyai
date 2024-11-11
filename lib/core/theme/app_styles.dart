import 'package:flutter/material.dart';
import 'package:imageifyai/core/components/buttons/app_button.dart';
import 'package:imageifyai/core/constants/color_constants.dart';
import 'app_tokens.dart';

/// Uygulama genelinde kullanılan stil tanımlamaları
class AppStyles {
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
        backgroundColor: AppColors.primary.withOpacity(0.15),
        foregroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(
          horizontal: AppTokens.elevationLg,
          vertical: AppTokens.elevationSm,
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(AppTokens.radiusMd),
        ),
        elevation: 0,
      );

  static ButtonStyle get secondaryButtonStyle => ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(
          horizontal: AppTokens.elevationLg, // Primary ile aynı padding
          vertical: AppTokens.elevationSm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusMd),
          side: const BorderSide(color: AppColors.primary), // Primary ile aynı border
        ),
        elevation: 0,
      );
  static ButtonStyle get textButtonStyle => TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: AppTokens.elevationMd,
          vertical: AppTokens.elevationSm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusMd),
          side: const BorderSide(color: Colors.white),
        ),
        elevation: 0,
      );

  static TextStyle getButtonTextStyle(AppButtonType type, AppButtonSize size) {
    final fontSize = size == AppButtonSize.small
        ? 12
        : size == AppButtonSize.medium
            ? 14
            : 16;

    return TextStyle(
      color: type == AppButtonType.primary ? AppColors.primary : AppColors.primary,
      fontSize: fontSize.toDouble(),
      fontWeight: FontWeight.w600,
    );
  }

  static ButtonStyle get iconButtonStyle => IconButton.styleFrom(
        foregroundColor: AppColors.primary,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(AppTokens.elevationSm),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusSm),
        ),
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

  /// Button boyutlandırma ve stil methodları
  static double getButtonHeight(AppButtonSize size) {
    switch (size) {
      case AppButtonSize.small:
        return 32;
      case AppButtonSize.medium:
        return 44;
      case AppButtonSize.large:
        return 52;
    }
  }

  static double getButtonIconSize(AppButtonSize size) {
    switch (size) {
      case AppButtonSize.small:
        return 16;
      case AppButtonSize.medium:
        return 20;
      case AppButtonSize.large:
        return 24;
    }
  }
}
