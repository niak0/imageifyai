import 'package:flutter/material.dart';
import 'package:imageifyai/core/services/navigation_service.dart';
import 'package:imageifyai/core/theme/app_styles.dart';
import 'package:imageifyai/features/text_to_image/view/widgets/full_screen_input.dart';
import '../../../../core/constants/color_constants.dart';
import 'package:imageifyai/features/text_to_image/viewmodel/text_to_image_view_model.dart';

class ChatInput extends StatelessWidget {
  final TextToImageViewModel viewModel;

  const ChatInput({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                icon: const Icon(Icons.casino, color: AppColors.primary),
                label: 'Beni Şaşırt',
                onTap: viewModel.handleSurpriseMe,
              ),
              const SizedBox(width: 16),
              _buildActionButton(
                icon: viewModel.selectedImage == null
                    ? const Icon(Icons.add_photo_alternate_outlined, color: AppColors.primary)
                    : Image.file(
                        viewModel.selectedImage!,
                        width: 24,
                        height: 24,
                        fit: BoxFit.cover,
                      ),
                label: viewModel.selectedImage == null ? 'Görsel Ekle' : 'Görseli Kaldır',
                onTap: () => viewModel.handleImageAdd(context),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Ana İstem Input Alanı
          GestureDetector(
            onTap: () => _openFullScreenInput(context),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.primary,
                  width: 3.0,
                ),
              ),
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: viewModel.textController,
                enabled: false,
                maxLines: 2,
                style: const TextStyle(color: AppColors.textPrimary),
                decoration: AppStyles.inputDecoration.copyWith(
                  hintText: 'İstem Girin\nGörsel türü, obje, herhangi bir det...',
                  hintStyle: const TextStyle(color: AppColors.textSecondary),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          // Genişletilmiş içerik
          Column(
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
                    controller: viewModel.negativePromptController,
                    enabled: false,
                    maxLines: 1,
                    style: const TextStyle(color: AppColors.textPrimary),
                    decoration: AppStyles.inputDecoration.copyWith(
                      hintText: 'Negatif İstem Girin',
                      hintStyle: const TextStyle(color: AppColors.textSecondary),
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
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: viewModel.styles.length,
                      itemBuilder: (context, index) {
                        final style = viewModel.styles[index];
                        final isSelected = style == viewModel.selectedStyle;
                        return _buildStyleCard(
                          title: style.name,
                          imagePath: style.imagePath,
                          isSelected: isSelected,
                          onTap: () => viewModel.selectStyle(style),
                        );
                      },
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: viewModel.aspectRatios.map((ratio) {
                        final isSelected = ratio == viewModel.selectedAspectRatio;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: _buildAspectRatioButton(
                            ratio: ratio.label,
                            isSelected: isSelected,
                            onTap: () => viewModel.selectAspectRatio(ratio),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required Widget icon,
    required String label,
    required VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStyleCard({
    required String title,
    required String imagePath,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }

  Widget _buildAspectRatioButton({
    required String ratio,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }

  Future<void> _openFullScreenInput(BuildContext context) async {
    final result = await NavigationService().navigateToPage(FullScreenInput(
      initialText: viewModel.textController.text,
      onSubmit: (value) {
        NavigationService().goBack(value);
      },
      onSurpriseMe: viewModel.handleSurpriseMe,
    ));
    if (result != null) {
      viewModel.textController.text = result;
    }
  }
}
