import 'package:flutter/material.dart';

class NeonBorder extends StatelessWidget {
  final Widget child;
  final Color color;
  final double intensity;
  final double borderRadius;
  final double blurRadius;
  final double spreadRadius;

  const NeonBorder({
    super.key,
    required this.child,
    required this.color,
    this.intensity = 0.5,
    this.borderRadius = 16,
    this.blurRadius = 8,
    this.spreadRadius = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // Koyu arka plan
        color: const Color(0x40000000), // %25 opaklık

        // Köşe yuvarlaklığı
        borderRadius: BorderRadius.circular(borderRadius),

        // Neon kenarlık
        border: Border.all(
          color: color.withOpacity(intensity),
          width: 1,
        ),

        // Neon glow efekti
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(intensity * 0.4),
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
          ),
        ],
      ),
      child: child,
    );
  }
}
