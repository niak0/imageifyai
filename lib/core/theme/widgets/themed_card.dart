import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/color_constants.dart';
import 'package:imageifyai/core/theme/app_theme.dart';
import 'glass_container.dart';
import 'neon_border.dart';

class ThemedCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final ThemeStyle? style;
  final double? blur;
  final EdgeInsetsGeometry? padding;

  const ThemedCard({
    super.key,
    required this.child,
    this.color,
    this.style,
    this.blur,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    if (!AppTheme.instance.isDark) {
      return Padding(
        padding: padding ?? EdgeInsets.zero,
        child: child,
      );
    }

    final cardStyle = style ?? AppTheme.instance.style;
    final themeColor = color ?? AppColors.primary;
    final content = Padding(
      padding: padding ?? EdgeInsets.zero,
      child: child,
    );

    switch (cardStyle) {
      case ThemeStyle.glass:
        return GlassContainer(
          borderColor: themeColor,
          blur: blur ?? AppTheme.instance.glassBlur,
          child: content,
        );

      case ThemeStyle.neon:
        return NeonBorder(
          color: themeColor,
          intensity: AppTheme.instance.neonIntensity,
          child: content,
        );

      case ThemeStyle.gradient:
        return Container(
          decoration: AppTheme.instance.getDecoration(color: themeColor),
          child: content,
        );

      case ThemeStyle.minimal:
        return Container(
          decoration: AppTheme.instance.getDecoration(
            color: themeColor.withOpacity(0.1),
          ),
          child: content,
        );
    }
  }
}
