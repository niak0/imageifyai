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
      scale: onPressed == null || isLoading ? 0.9 : 1.0,
      duration: AppAnimations.fast,
      child: SizedBox(
        width: isFullWidth ? double.infinity : null,
        height: AppStyles.getButtonHeight(size),
        child: _buildButton(),
      ),
    );
  }

  Widget _buildButton() {
    return switch (type) {
      AppButtonType.primary || AppButtonType.secondary => ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: _getButtonStyle(),
          child: _buildButtonContent(),
        ),
      AppButtonType.text => TextButton(
          onPressed: isLoading ? null : onPressed,
          style: textButtonStyle,
          child: _buildButtonContent(),
        ),
    };
  }

  Widget _buildButtonContent() {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            type == AppButtonType.text ? AppColors.text : AppColors.primary,
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
        Text(text, style: _getTextStyle()),
        if (rightIcon != null) ...[
          const SizedBox(width: AppTokens.elevationSm),
          Icon(rightIcon, size: AppStyles.getButtonIconSize(size)),
        ],
      ],
    );
  }

  ButtonStyle _getButtonStyle() {
    final baseStyle = ElevatedButton.styleFrom(
      backgroundColor: type == AppButtonType.primary ? AppColors.primary.withOpacity(0.2) : Colors.transparent,
      foregroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.primary),
        borderRadius: BorderRadius.circular(AppTokens.radiusMd),
      ),
      elevation: 0,
    );

    return type == AppButtonType.text ? textButtonStyle : baseStyle;
  }

  static ButtonStyle get textButtonStyle => TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: AppTokens.elevationMd,
          vertical: AppTokens.elevationSm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusMd),
          side: const BorderSide(color: Colors.white),
        ),
        elevation: 0,
      );

  TextStyle _getTextStyle() {
    final fontSize = switch (size) {
      AppButtonSize.small => 12.0,
      AppButtonSize.medium => 14.0,
      AppButtonSize.large => 16.0,
    };

    return TextStyle(
      color: type == AppButtonType.text ? AppColors.text : AppColors.primary,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
    );
  }
}
