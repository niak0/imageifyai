import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/color_constants.dart';
import 'package:imageifyai/core/theme/app_theme.dart';

/// Icon Extension
extension ThemedIconExtension on Icon {
  Widget withEffect({Color? color}) {
    if (!AppTheme.instance.isDark) return this;

    final effectColor = color ?? AppColors.primary;
    return Icon(
      icon,
      size: size,
      color: effectColor,
      shadows: [
        Shadow(
          color: effectColor,
          blurRadius: 8,
        ),
      ],
    );
  }
}

/// Text Extension
extension ThemedTextExtension on Text {
  Widget withEffect({Color? color}) {
    if (!AppTheme.instance.isDark) return this;

    final effectColor = color ?? AppColors.primary;
    return Text(
      data!,
      style: style?.copyWith(
        shadows: [
          Shadow(
            color: effectColor,
            blurRadius: 4,
          ),
        ],
      ),
    );
  }
}
