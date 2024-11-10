import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/color_constants.dart';
import 'package:imageifyai/core/themes/cyberpunk/cyberpunk_theme.dart';
import 'package:imageifyai/core/themes/cyberpunk/widgets/glass_container.dart';
import 'package:imageifyai/core/themes/cyberpunk/widgets/neon_border.dart';

class CyberpunkCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final CyberpunkStyle? style;

  const CyberpunkCard({
    super.key,
    required this.child,
    this.color,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    if (!CyberpunkTheme.enabled) return child;

    final cardStyle = style ?? CyberpunkTheme.defaultStyle;
    final themeColor = color ?? AppColors.primary;

    switch (cardStyle) {
      case CyberpunkStyle.glass:
        return GlassContainer(
          borderColor: themeColor,
          child: child,
        );

      case CyberpunkStyle.neon:
        return NeonBorder(
          color: themeColor,
          child: child,
        );

      case CyberpunkStyle.gradient:
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                themeColor.withOpacity(CyberpunkTheme.gradientOpacity),
                themeColor.withOpacity(CyberpunkTheme.gradientOpacity * 0.5),
              ],
            ),
          ),
          child: child,
        );

      case CyberpunkStyle.minimal:
        return child;
    }
  }
}
