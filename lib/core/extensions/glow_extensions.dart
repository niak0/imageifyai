import 'package:flutter/material.dart';
import 'package:imageifyai/product/tokens/colors.dart';

/// Icon Extension
extension ThemedIconExtension on Icon {
  Widget withEffect({Color? color}) {
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
  Widget withEffect({
    Color? color,
    double textOpacity = 1.0,
    double glowOpacity = 1.0,
    double blurRadius = 1.0,
  }) {
    final effectColor = color ?? AppColors.primary;
    return Text(
      data ?? '',
      style: (style ?? const TextStyle()).copyWith(
        color: effectColor.withOpacity(textOpacity),
        shadows: [
          Shadow(
            color: effectColor.withOpacity(glowOpacity),
            blurRadius: blurRadius,
          ),
        ],
      ),
    );
  }
}

extension GlowEffect on BoxDecoration {
  BoxDecoration withGlowEffect({
    Color? glowColor,
    double blurRadius = 1.0,
    double spreadRadius = 1.5,
    bool onlyBorder = false,
  }) {
    final effectColor = glowColor ?? color ?? AppColors.primary;

    return copyWith(
      boxShadow: [
        if (!onlyBorder)
          BoxShadow(
            color: effectColor.withOpacity(0.3),
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
          ),
        // Kenar glow efekti
        BoxShadow(
          color: effectColor.withOpacity(0.3),
          blurRadius: blurRadius / 2,
          spreadRadius: -1,
        ),
      ],
    );
  }
}
