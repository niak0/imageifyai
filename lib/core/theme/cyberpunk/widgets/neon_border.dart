import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/color_constants.dart';
import 'package:imageifyai/core/theme/cyberpunk/cyberpunk_theme.dart';

class NeonBorder extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? intensity;

  const NeonBorder({
    super.key,
    required this.child,
    this.color,
    this.intensity,
  });

  @override
  Widget build(BuildContext context) {
    if (!CyberpunkTheme.instance.enabled) return child;

    final neonColor = color ?? AppColors.primary;
    final neonIntensity = intensity ?? CyberpunkTheme.instance.neonIntensity;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: neonColor.withOpacity(neonIntensity),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: neonColor.withOpacity(neonIntensity * 0.4),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}
