import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/color_constants.dart';
import 'package:imageifyai/core/themes/cyberpunk/cyberpunk_theme.dart';
import 'package:imageifyai/core/themes/cyberpunk/widgets/glass_container.dart';
import 'package:imageifyai/core/themes/cyberpunk/widgets/neon_border.dart';

class CyberpunkCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final CyberpunkStyle? style;
  final double? blur;

  const CyberpunkCard({
    super.key,
    required this.child,
    this.color,
    this.style,
    this.blur,
  });

  @override
  Widget build(BuildContext context) {
    if (!CyberpunkTheme.enabled) return child;

    final cardStyle = style ?? CyberpunkTheme.defaultStyle;
    final themeColor = color ?? AppColors.primary;

    Widget cardContent = Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundDark.withOpacity(0.6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );

    switch (cardStyle) {
      case CyberpunkStyle.glass:
        return GlassContainer(
          borderColor: themeColor,
          blur: blur,
          child: cardContent,
        );

      case CyberpunkStyle.neon:
        return NeonBorder(
          color: themeColor,
          child: cardContent,
        );

      case CyberpunkStyle.gradient:
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.backgroundDark.withOpacity(0.95),
                themeColor.withOpacity(0.1),
              ],
            ),
            border: Border.all(
              color: themeColor.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: child,
        );

      case CyberpunkStyle.minimal:
        return cardContent;
    }
  }
}
