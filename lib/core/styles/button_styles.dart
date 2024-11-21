import 'package:flutter/material.dart';
import 'package:imageifyai/core/tokens/app_tokens.dart';
import '../tokens/colors.dart';

enum AppButtonType { primary, secondary, text }

enum AppButtonSize { small, medium, large }

abstract class ButtonStyles {
  static ButtonStyle getButtonStyle({
    required AppButtonType type,
    required AppButtonSize size,
    required Color color,
  }) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppTokens.radiusMd),
    );

    switch (type) {
      case AppButtonType.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: color.withOpacity(0.2),
          foregroundColor: color,
          padding: _getPadding(size),
          shape: shape.copyWith(
            side: BorderSide(color: color.withOpacity(0.5), width: 1.5),
          ),
          elevation: 0,
        ).copyWith(
          overlayColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return color.withOpacity(0.1);
            }
            return null;
          }),
        );

      case AppButtonType.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: color,
          padding: _getPadding(size),
          shape: shape.copyWith(
            side: BorderSide(color: color.withOpacity(0.5), width: 1.5),
          ),
          elevation: 0,
        ).copyWith(
          overlayColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return color.withOpacity(0.3);
            }
            return null;
          }),
        );

      case AppButtonType.text:
        return TextButton.styleFrom(
          foregroundColor: color,
          padding: _getPadding(size),
          shape: shape,
        );
    }
  }

  static TextStyle getTextStyle({
    required AppButtonSize size,
    required Color color,
    required bool isTextButton,
  }) {
    return TextStyle(
      color: isTextButton ? color : AppColors.primary,
      fontSize: _getFontSize(size),
      fontWeight: FontWeight.w600,
    );
  }

  static double getIconSize(AppButtonSize size) {
    switch (size) {
      case AppButtonSize.small:
        return AppTokens.iconXs;
      case AppButtonSize.medium:
        return AppTokens.iconSm;
      case AppButtonSize.large:
        return AppTokens.iconMd;
    }
  }

  static EdgeInsets _getPadding(AppButtonSize size) {
    switch (size) {
      case AppButtonSize.small:
        return AppTokens.paddingAllSm;
      case AppButtonSize.medium:
        return AppTokens.paddingAllMd;
      case AppButtonSize.large:
        return AppTokens.paddingAllLg;
    }
  }

  static double _getFontSize(AppButtonSize size) {
    switch (size) {
      case AppButtonSize.small:
        return AppTokens.fontXs;
      case AppButtonSize.medium:
        return AppTokens.fontSm;
      case AppButtonSize.large:
        return AppTokens.fontMd;
    }
  }
}
