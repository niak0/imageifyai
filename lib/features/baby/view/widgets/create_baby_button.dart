import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/color_constants.dart';
import '../../../../core/components/buttons/app_button.dart';

class CreateBabyButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback? onPressed;

  const CreateBabyButton({
    super.key,
    required this.isEnabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      color: AppColors.tools,
      text: 'Bebeği Oluştur',
      onPressed: isEnabled ? onPressed : null,
      size: AppButtonSize.large,
      isFullWidth: true,
    );
  }
}
