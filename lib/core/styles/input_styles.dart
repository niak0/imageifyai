import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/app_tokens.dart';

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
        contentPadding: AppTokens.paddingAllMd,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusMd),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusMd),
          borderSide: BorderSide(
            color: AppColors.withOpacity(AppColors.text, opacity: 0.1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusMd),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      );
}
