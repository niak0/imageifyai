import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/color_constants.dart';
import 'package:imageifyai/core/theme/app_theme.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double? blur;
  final Color? borderColor;

  const GlassContainer({
    super.key,
    required this.child,
    this.blur,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    if (!AppTheme.instance.isDark) return child;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blur ?? AppTheme.instance.glassBlur,
          sigmaY: blur ?? AppTheme.instance.glassBlur,
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.1),
                Colors.white.withOpacity(0.05),
              ],
            ),
            border: Border.all(
              color: (borderColor ?? AppColors.primary).withOpacity(0.2),
              width: 1,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
