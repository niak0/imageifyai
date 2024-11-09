import 'package:flutter/material.dart';
import 'package:imageifyai/core/theme/app_styles.dart';
import '../../../../core/constants/color_constants.dart';

class ChatInput extends StatelessWidget {
  final Function(String) onSend;
  final VoidCallback? onSurpriseMe;
  final VoidCallback? onAddImage;
  final double expandRatio;

  const ChatInput({
    super.key,
    required this.onSend,
    this.onSurpriseMe,
    this.onAddImage,
    required this.expandRatio,
  });

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.outline,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Üst Butonlar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildActionButton(
                icon: Icons.casino,
                label: 'Beni Şaşırt',
                onTap: onSurpriseMe,
              ),
              const SizedBox(width: 16),
              _buildActionButton(
                icon: Icons.add_photo_alternate_outlined,
                label: 'Görsel Ekle',
                onTap: onAddImage,
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Ana İstem Input Alanı
          InkWell(
            onTap: () {
              print("object");
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.primary,
                  width: 3.0, // Kalın kenar
                ),
              ),
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textController,
                enabled: false,
                maxLines: 2,
                style: const TextStyle(color: AppColors.textPrimary),
                decoration: AppStyles.inputDecoration.copyWith(
                  hintText: 'İstem Girin\nGörsel türü, obje, herhangi bir det...',
                  hintStyle: TextStyle(color: AppColors.textSecondary),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          // Genişletilmiş içerik
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: expandRatio,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                // Negatif Prompt
                InkWell(
                  onTap: () {
                    print("object");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.outline,
                        width: 3.0, // Kalın kenar
                      ),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: textController,
                      enabled: false,
                      maxLines: 1,
                      style: const TextStyle(color: AppColors.textPrimary),
                      decoration: AppStyles.inputDecoration.copyWith(
                        hintText: 'Negatif İstem Girin',
                        hintStyle: TextStyle(color: AppColors.textSecondary),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Negatif İstem Girin',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                // Stiller
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Stil Seçin',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildStyleCard('SDXL Light', 'assets/images/style1.jpg', true),
                          _buildStyleCard('Digital Sanat', 'assets/images/style2.jpg', false),
                          _buildStyleCard('İleri', 'assets/images/style3.jpg', false),
                          _buildStyleCard('Fotoğraf', 'assets/images/style4.jpg', false),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Görsel Oranı
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Görsel Oranı:',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        _buildAspectRatioButton('1:1', true),
                        const SizedBox(width: 8),
                        _buildAspectRatioButton('2:3', false),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback? onTap,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.primary),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.primary,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildStyleCard(String title, String imagePath, bool isSelected) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? AppColors.primary : Colors.transparent,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://picsum.photos/80',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAspectRatioButton(String ratio, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.outline,
        ),
        color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.transparent,
      ),
      child: Text(
        ratio,
        style: TextStyle(
          color: isSelected ? AppColors.primary : AppColors.textSecondary,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
