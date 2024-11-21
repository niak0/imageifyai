import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/app_constants.dart';

abstract class InputStyles {
  static InputDecoration primary({
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) =>
      InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.textLow),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColors.withOpacity(AppColors.surface),
        contentPadding: AppConstants.paddingAllMd,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.cardBorderRadius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.cardBorderRadius),
          borderSide: BorderSide(
            color: AppColors.withOpacity(AppColors.text, opacity: 0.1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.cardBorderRadius),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      );
}
