import 'package:flutter/material.dart';
import 'package:imageifyai/product/tokens/colors.dart';

abstract class AppDecorations {
  // Base decoration

  static BoxDecoration get baseContainer => BoxDecoration(
        color: AppColors.primary.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.3),
          width: 1.0,
        ),
      );

  // Transparent container
  static BoxDecoration get transparentContainer => baseContainer.copyWith(
        color: Colors.transparent,
      );

  // Surface container
  static BoxDecoration get surfaceContainer => baseContainer.copyWith(
        color: AppColors.surface.withOpacity(0.8),
      );

  // Secondary container
  static BoxDecoration get secondaryContainer => baseContainer.copyWith(
        color: AppColors.secondary.withOpacity(0.8),
      );
}
