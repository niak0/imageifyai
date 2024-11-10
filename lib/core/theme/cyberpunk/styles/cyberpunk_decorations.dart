import 'package:flutter/material.dart';
import 'cyberpunk_colors.dart';

class CyberpunkDecorations {
  static BoxDecoration glassDecoration({
    Color? color,
    double opacity = 0.1,
    double borderOpacity = 0.2,
  }) {
    final effectiveColor = color ?? CyberpunkColors.neonBlue;
    return BoxDecoration(
      color: CyberpunkColors.surface.withOpacity(0.95),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: effectiveColor.withOpacity(borderOpacity),
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: effectiveColor.withOpacity(opacity),
          blurRadius: 8,
          spreadRadius: 0,
        ),
      ],
    );
  }

  static BoxDecoration neonDecoration({
    Color? color,
    double intensity = 0.5,
  }) {
    final effectiveColor = color ?? CyberpunkColors.neonBlue;
    return BoxDecoration(
      color: CyberpunkColors.surface.withOpacity(0.95),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: effectiveColor.withOpacity(intensity),
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: effectiveColor.withOpacity(intensity * 0.4),
          blurRadius: 8,
          spreadRadius: 1,
        ),
      ],
    );
  }
}
