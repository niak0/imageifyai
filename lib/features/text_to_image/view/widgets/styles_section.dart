import 'package:flutter/material.dart';
import 'package:imageifyai/features/text_to_image/model/image_options.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/text_to_image_view_model.dart';

class StylesSection extends StatelessWidget {
  const StylesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        itemCount: Styles.values.length,
        itemBuilder: (context, index) {
          final style = Styles.values[index];
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: _StyleCard(style: style),
          );
        },
      ),
    );
  }
}

class _StyleCard extends StatelessWidget {
  final Styles style;

  const _StyleCard({required this.style});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TextToImageViewModel>();
    final isSelected = viewModel.selectedStyle == style;

    return GestureDetector(
      onTap: () => viewModel.selectStyle(style),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? Theme.of(context).colorScheme.primary : Colors.transparent,
            width: 2,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                "style.imageUrl",
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                  child: Text(
                    "style.title",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
