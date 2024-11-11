import 'dart:ui';

import 'package:flutter/material.dart';

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
    // Opaklık ve oranlar, sınıf içinde belirlenen değerlerle kontrol edilecek.
    const double borderOpacity = 0.2;
    const double shadowOpacity = 0.15;
    const double backgroundOpacity = 0.1;
    const double shadowBlurRadius = 12;
    const double shadowSpreadRadius = 2;

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
            color: color.withOpacity(backgroundOpacity),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: color.withOpacity(borderOpacity),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(shadowOpacity),
                blurRadius: shadowBlurRadius,
                spreadRadius: shadowSpreadRadius,
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
