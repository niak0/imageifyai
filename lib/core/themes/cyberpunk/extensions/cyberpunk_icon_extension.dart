import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/color_constants.dart';
import 'package:imageifyai/core/themes/cyberpunk/cyberpunk_theme.dart';

extension CyberpunkIconExtension on Icon {
  Widget withNeonEffect({Color? color}) {
    if (!CyberpunkTheme.enabled) return this;

    final neonColor = color ?? AppColors.primary;
    return Icon(
      icon,
      size: size,
      color: neonColor,
      shadows: [
        Shadow(
          color: neonColor,
          blurRadius: 8,
        ),
      ],
    );
  }
}
