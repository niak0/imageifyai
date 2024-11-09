import 'package:flutter/material.dart';
import '../../../../core/constants/color_constants.dart';
import 'full_screen_input.dart';

class ChatInput extends StatelessWidget {
  final Function(String) onSend;
  final VoidCallback? onSurpriseMe;
  final VoidCallback? onAddImage;

  const ChatInput({
    super.key,
    required this.onSend,
    this.onSurpriseMe,
    this.onAddImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(
          top: BorderSide(
            color: AppColors.outline.withOpacity(0.1),
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Üst kısımdaki butonlar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton(
                onPressed: onSurpriseMe,
                icon: Icons.casino,
                label: 'Beni Şaşırt',
              ),
              _buildActionButton(
                onPressed: onAddImage,
                icon: Icons.add_photo_alternate_outlined,
                label: 'Görsel Ekle',
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Input alanı
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => FullScreenInput(
                  onSubmit: onSend,
                  onSurpriseMe: onSurpriseMe,
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.surfaceVariant,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: AppColors.primary.withOpacity(0.5),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'İstem Girin',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Oluştur',
                      style: TextStyle(
                        color: AppColors.onPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required VoidCallback? onPressed,
    required IconData icon,
    required String label,
  }) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: AppColors.primary),
      label: Text(
        label,
        style: const TextStyle(
          color: AppColors.primary,
        ),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}
