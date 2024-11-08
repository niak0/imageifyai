import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/text_to_image_view_model.dart';
import '../../model/image_options.dart';
import '../../../../core/theme/app_styles.dart';

class QualitySelector extends StatelessWidget {
  const QualitySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TextToImageViewModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kalite Seçin',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Row(
          children: ImageQuality.values.map((quality) {
            final isSelected = viewModel.selectedQuality == quality;
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: GestureDetector(
                  onTap: () => viewModel.setQuality(quality),
                  child: Container(
                    decoration: isSelected ? AppStyles.activeCardDecoration : AppStyles.cardDecoration,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    child: Column(
                      children: [
                        Text(
                          _getQualityLabel(quality),
                          style: TextStyle(
                            color: isSelected ? Theme.of(context).primaryColor : null,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _getQualityDescription(quality),
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

  String _getQualityLabel(ImageQuality quality) {
    switch (quality) {
      case ImageQuality.low:
        return 'Düşük';
      case ImageQuality.medium:
        return 'Orta';
      case ImageQuality.high:
        return 'Yüksek';
    }
  }

  String _getQualityDescription(ImageQuality quality) {
    switch (quality) {
      case ImageQuality.low:
        return 'Düşük kalite, daha az boyut ve daha az detay içerir.';
      case ImageQuality.medium:
        return 'Orta kalite, orta boyut ve orta detay içerir.';
      case ImageQuality.high:
        return 'Yüksek kalite, büyük boyut ve yüksek detay içerir.';
    }
  }
}
