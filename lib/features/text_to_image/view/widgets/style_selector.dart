import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/text_to_image_view_model.dart';
import '../../model/image_options.dart';
import '../../../../core/theme/app_styles.dart';

class StyleSelector extends StatelessWidget {
  const StyleSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TextToImageViewModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Stil Seçin',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: Styles.values.map((style) {
            final isSelected = viewModel.selectedStyle == style;
            return GestureDetector(
              onTap: () => viewModel.selectStyle(style),
              child: Container(
                decoration: isSelected ? AppStyles.activeCardDecoration : AppStyles.cardDecoration,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Text(
                  style.prompt,
                  style: TextStyle(
                    color: isSelected ? Theme.of(context).primaryColor : null,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
