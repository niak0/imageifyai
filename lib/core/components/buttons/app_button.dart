import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/animation_constants.dart';
import 'package:imageifyai/core/theme/app_tokens.dart';
import '../../theme/app_styles.dart';
import '../../constants/color_constants.dart';

enum AppButtonType { primary, secondary, text }

enum AppButtonSize { small, medium, large }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final AppButtonSize size;
  final bool isLoading;
  final bool isFullWidth;
  final IconData? leftIcon;
  final IconData? rightIcon;

  const AppButton({
    required this.text,
    this.onPressed,
    this.type = AppButtonType.primary,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = false,
    this.leftIcon,
    this.rightIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: onPressed == null || isLoading ? 0.95 : 1.0,
      duration: AppAnimations.fast,
      child: SizedBox(
        width: isFullWidth ? double.infinity : null,
        height: AppStyles.getButtonHeight(size),
        child: _buildButton(),
      ),
    );
  }

  Widget _buildButton() {
    switch (type) {
      case AppButtonType.primary:
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: AppStyles.primaryButtonStyle,
          child: _buildButtonContent(),
        );
      case AppButtonType.secondary:
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: AppStyles.secondaryButtonStyle,
          child: _buildButtonContent(),
        );
      case AppButtonType.text:
        return TextButton(
          onPressed: isLoading ? null : onPressed,
          style: AppStyles.textButtonStyle,
          child: _buildButtonContent(),
        );
    }
  }

  Widget _buildButtonContent() {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            type == AppButtonType.primary ? AppColors.primary : AppColors.onPrimary,
          ),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leftIcon != null) ...[
          Icon(leftIcon, size: AppStyles.getButtonIconSize(size)),
          const SizedBox(width: AppTokens.elevationSm),
        ],
        Text(
          text,
          style: AppStyles.getButtonTextStyle(type, size),
        ),
        if (rightIcon != null) ...[
          const SizedBox(width: AppTokens.elevationSm),
          Icon(rightIcon, size: AppStyles.getButtonIconSize(size)),
        ],
      ],
    );
  }
}
