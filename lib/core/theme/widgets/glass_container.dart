import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/color_constants.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final Color? backgroundColor;
  final double blur;
  final double? height;

  const GlassContainer({
    super.key,
    required this.child,
    required this.color,
    this.backgroundColor,
    this.blur = 3.0,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blur,
          sigmaY: blur,
        ),
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: color.withOpacity(AppColors.borderOpacity),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.08),
                blurRadius: 10,
                spreadRadius: 0,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
