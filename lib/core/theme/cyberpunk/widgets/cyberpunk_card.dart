import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/color_constants.dart';
import 'package:imageifyai/core/theme/app_theme.dart';
import 'package:imageifyai/core/theme/cyberpunk/widgets/glass_container.dart';
import 'package:imageifyai/core/theme/cyberpunk/widgets/neon_border.dart';

class CyberpunkCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final ThemeStyle? style;
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
    if (!AppTheme.instance.isDark) return child;

    final cardStyle = style ?? AppTheme.instance.style;
    final themeColor = color ?? AppColors.primary;

    Widget cardContent = Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundDark.withOpacity(0.6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );

    switch (cardStyle) {
      case ThemeStyle.glass:
        return GlassContainer(
          borderColor: themeColor,
          blur: blur,
          child: cardContent,
        );

      case ThemeStyle.neon:
        return NeonBorder(
          color: themeColor,
          child: cardContent,
        );

      case ThemeStyle.gradient:
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

      case ThemeStyle.minimal:
        return cardContent;
    }
  }
}
