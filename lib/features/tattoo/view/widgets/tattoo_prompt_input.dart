import 'package:flutter/material.dart';
import '../../../../core/constants/color_constants.dart';

class TattooPromptInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onSurpriseMe;
  final Function(String)? onSubmitted;

  const TattooPromptInput({
    super.key,
    required this.controller,
    this.onSurpriseMe,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
        color: AppColors.surfaceVariant,
      ),
      child: Column(
        children: [
          TextField(
            controller: controller,
            maxLines: 4,
            minLines: 3,
            style: const TextStyle(color: AppColors.textPrimary),
            decoration: InputDecoration(
              hintText: 'Dövme fikrinizi anlatın',
              hintStyle: TextStyle(color: AppColors.textSecondary),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.smart_toy_outlined),
                    color: AppColors.primary,
                    onPressed: onSurpriseMe,
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    color: AppColors.primary,
                    onPressed: () => onSubmitted?.call(controller.text),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 