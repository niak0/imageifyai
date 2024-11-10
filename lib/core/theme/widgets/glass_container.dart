import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/color_constants.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final Color borderColor;
  final double blur;

  const GlassContainer({
    super.key,
    required this.child,
    required this.borderColor,
    this.blur = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.95),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor.withOpacity(AppColors.borderOpacity),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: borderColor.withOpacity(AppColors.glowOpacity),
            blurRadius: blur,
            spreadRadius: 0,
          ),
        ],
      ),
      child: child,
    );
  }
}
