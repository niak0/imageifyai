import 'package:flutter/material.dart';
import 'package:imageifyai/product/tokens/animations.dart';
import 'package:imageifyai/product/tokens/app_tokens.dart';
import '../../../product/styles/button_styles.dart';
import '../../../product/tokens/colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final AppButtonSize size;
  final bool isLoading;
  final bool isFullWidth;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final Color color;

  const AppButton({
    required this.text,
    this.onPressed,
    this.type = AppButtonType.primary,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = false,
    this.leftIcon,
    this.rightIcon,
    this.color = AppColors.primary,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ButtonStyles.getButtonStyle(
      type: type,
      size: size,
      color: color,
    );

    final child = isLoading
        ? _buildLoadingIndicator()
        : _ButtonContent(
            text: text,
            size: size,
            leftIcon: leftIcon,
            rightIcon: rightIcon,
            color: color,
            isTextButton: type == AppButtonType.text,
          );

    return AnimatedScale(
      scale: onPressed == null || isLoading ? 0.9 : 1.0,
      duration: AppAnimations.fast,
      child: SizedBox(
        width: isFullWidth ? double.infinity : null,
        child: _buildButton(child, buttonStyle),
      ),
    );
  }

  Widget _buildButton(Widget child, ButtonStyle style) {
    switch (type) {
      case AppButtonType.primary:
      case AppButtonType.secondary:
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: style,
          child: child,
        );
      case AppButtonType.text:
        return TextButton(
          onPressed: isLoading ? null : onPressed,
          style: style,
          child: child,
        );
    }
  }

  Widget _buildLoadingIndicator() {
    return SizedBox(
      height: ButtonStyles.getIconSize(size),
      width: ButtonStyles.getIconSize(size),
      child: CircularProgressIndicator(
        strokeWidth: 3,
        valueColor: AlwaysStoppedAnimation<Color>(
          type == AppButtonType.text ? AppColors.text : color,
        ),
      ),
    );
  }
}

class _ButtonContent extends StatelessWidget {
  final String text;
  final AppButtonSize size;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final Color color;
  final bool isTextButton;

  const _ButtonContent({
    required this.text,
    required this.size,
    this.leftIcon,
    this.rightIcon,
    required this.color,
    required this.isTextButton,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = ButtonStyles.getTextStyle(
      size: size,
      color: color,
      isTextButton: isTextButton,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leftIcon != null) ...[
          Icon(leftIcon, size: ButtonStyles.getIconSize(size)),
          const SizedBox(width: AppTokens.spacingXs),
        ],
        Text(text, style: textStyle),
        if (rightIcon != null) ...[
          const SizedBox(width: AppTokens.spacingXs),
          Icon(rightIcon, size: ButtonStyles.getIconSize(size)),
        ],
      ],
    );
  }
}
