import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/color_constants.dart';

class NeonBorder extends StatelessWidget {
  final Widget child;
  final Color color;
  final double intensity;

  const NeonBorder({
    super.key,
    required this.child,
    required this.color,
    this.intensity = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.95),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withOpacity(intensity),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(intensity * 0.4),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}
