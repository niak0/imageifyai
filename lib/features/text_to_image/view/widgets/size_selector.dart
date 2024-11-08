import 'package:flutter/material.dart';
import 'package:imageifyai/core/theme/app_styles.dart';
import 'package:imageifyai/features/text_to_image/model/image_options.dart';
import 'package:imageifyai/features/text_to_image/viewmodel/text_to_image_view_model.dart';
import 'package:provider/provider.dart';

class SizeSelector extends StatelessWidget {
  const SizeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TextToImageViewModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Boyut Seçin',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Row(
          children: ImageSize.values.map((size) {
            final isSelected = viewModel.selectedSize == size;
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: GestureDetector(
                  onTap: () => viewModel.setSize(size),
                  child: Container(
                    decoration: isSelected ? AppStyles.activeCardDecoration : AppStyles.cardDecoration,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    child: Column(
                      children: [
                        Text(
                          '${size.width}x${size.height}',
                          style: TextStyle(
                            color: isSelected ? Theme.of(context).primaryColor : null,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _getSizeLabel(size),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  String _getSizeLabel(ImageSize size) {
    switch (size) {
      case ImageSize.small:
        return 'Küçük';
      case ImageSize.medium:
        return 'Orta';
      case ImageSize.large:
        return 'Büyük';
    }
  }
}
