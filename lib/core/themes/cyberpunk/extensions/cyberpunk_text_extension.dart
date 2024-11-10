import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/color_constants.dart';
import 'package:imageifyai/core/themes/cyberpunk/cyberpunk_theme.dart';

extension CyberpunkTextExtension on Text {
  Widget withNeonEffect({Color? color}) {
    if (!CyberpunkTheme.enabled) return this;

    final neonColor = color ?? AppColors.primary;
    return Text(
      data!,
      style: style?.copyWith(
        shadows: [
          Shadow(
            color: neonColor,
            blurRadius: 4,
          ),
        ],
      ),
    );
  }
}
