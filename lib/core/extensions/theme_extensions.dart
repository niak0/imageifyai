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
  Widget withEffect({Color? color}) {
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
