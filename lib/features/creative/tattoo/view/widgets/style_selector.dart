import 'package:flutter/material.dart';
import '../../../../../core/constants/colors.dart';
import '../../model/tattoo_style.dart';

class StyleSelector extends StatelessWidget {
  final TattooStyle selectedStyle;
  final Function(TattooStyle) onStyleSelected;

  const StyleSelector({
    super.key,
    required this.selectedStyle,
    required this.onStyleSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: TattooStyle.values.map((style) {
          final isSelected = style == selectedStyle;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () => onStyleSelected(style),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected ? AppColors.primary : Colors.transparent,
                        width: 2,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(style.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    style.title,
                    style: TextStyle(
                      color: isSelected ? AppColors.primary : AppColors.textLow,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
