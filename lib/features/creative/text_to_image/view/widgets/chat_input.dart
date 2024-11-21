import 'package:flutter/material.dart';
import 'package:imageifyai/core/styles/input_styles.dart';
import 'package:imageifyai/core/constants/colors.dart';
import 'package:imageifyai/core/services/navigation_service.dart';
import 'package:imageifyai/features/creative/text_to_image/model/image_aspect_ratio.dart';
import 'package:imageifyai/features/creative/text_to_image/model/image_style.dart';
import 'package:imageifyai/features/creative/text_to_image/view/widgets/full_screen_input.dart';
import 'package:imageifyai/features/creative/text_to_image/viewmodel/text_to_image_view_model.dart';

class ChatInput extends StatelessWidget {
  final TextToImageViewModel viewModel;

  const ChatInput({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _dragIndicator(),
          _buildActionButtons(context),
          const SizedBox(height: 16),
          _buildPromptInput(context),
          _buildExpandedContent(),
        ],
      ),
    );
  }

  Container _dragIndicator() {
    return Container(
      width: 40,
      height: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.text.withOpacity(0.5),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildInputContainer({
    required TextEditingController controller,
    required int maxLines,
    required String hint,
    bool isPrimary = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isPrimary ? AppColors.primary : AppColors.outline,
          width: 1.0,
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          TextField(
            controller: controller,
            enabled: false,
            maxLines: maxLines,
            decoration: InputStyles.primary(hintText: hint),
          ),
          if (isPrimary)
            Positioned(
              right: 8,
              top: 8,
              child: Icon(
                Icons.drag_handle,
                color: AppColors.textLow.withOpacity(0.5),
                size: 24,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionButton(
          icon: Icon(Icons.casino, color: AppColors.primary.withOpacity(0.8)),
          label: 'Beni Şaşırt',
          onTap: viewModel.handleSurpriseMe,
        ),
        _buildActionButton(
          icon: Icon(Icons.draw, color: AppColors.primary.withOpacity(0.8)),
          label: 'Çiz',
          onTap: viewModel.handleSurpriseMe,
        ),
        _buildActionButton(
          icon: viewModel.selectedImage == null
              ? Icon(Icons.add_photo_alternate_outlined, color: AppColors.primary.withOpacity(0.8))
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
    );
  }

  Widget _buildActionButton({
    required Widget icon,
    required String label,
    required VoidCallback? onTap,
  }) {
    return TextButton.icon(onPressed: onTap, icon: icon, label: Text(label, style: TextStyle(color: AppColors.primary.withOpacity(0.8))));
  }

  Widget _buildPromptInput(BuildContext context) {
    return GestureDetector(
      onTap: () => _openFullScreenInput(context),
      child: _buildInputContainer(
        controller: viewModel.textController,
        maxLines: 2,
        hint: 'İstem Girin\nGörsel türü, obje, herhangi bir det...',
        isPrimary: true,
      ),
    );
  }

  Widget _buildExpandedContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        _buildNegativePrompt(),
        const SizedBox(height: 16),
        _buildStyleSelector(),
        const SizedBox(height: 16),
        _buildAspectRatioSelector(),
      ],
    );
  }

  Widget _buildNegativePrompt() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInputContainer(
          controller: viewModel.negativePromptController,
          maxLines: 1,
          hint: 'Negatif İstem Girin',
        ),
        const SizedBox(height: 5),
        const Text(
          'Negatif İstem Girin',
          style: TextStyle(color: AppColors.textLow, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildStyleSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Stil Seçin',
          style: TextStyle(
            color: AppColors.text,
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
            itemBuilder: (_, index) {
              final style = viewModel.styles[index];
              final isSelected = style == viewModel.selectedStyle;
              return _buildStyleCard(style, isSelected);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildStyleCard(ImageStyle style, bool isSelected) {
    return GestureDetector(
      onTap: () => viewModel.selectStyle(style),
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
                child: Image.network('https://picsum.photos/80', fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              style.name,
              style: TextStyle(
                color: isSelected ? AppColors.primary : AppColors.textLow,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAspectRatioSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Görsel Oranı:',
          style: TextStyle(
            color: AppColors.text,
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
                child: _buildAspectRatioButton(ratio, isSelected),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildAspectRatioButton(ImageAspectRatio ratio, bool isSelected) {
    return GestureDetector(
      onTap: () => viewModel.selectAspectRatio(ratio),
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
          ratio.toString(),
          style: TextStyle(
            color: isSelected ? AppColors.primary : AppColors.textLow,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Future<void> _openFullScreenInput(BuildContext context) async {
    final result = await NavigationService().navigateToPage(FullScreenInput(
      initialText: viewModel.textController.text,
      onSubmit: (value) => NavigationService().goBack(value),
      onSurpriseMe: viewModel.handleSurpriseMe,
    ));
    if (result != null) {
      viewModel.textController.text = result;
    }
  }
}
