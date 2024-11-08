import 'package:flutter/material.dart';
import 'package:imageifyai/core/widgets/gradient_scaffold.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/color_constants.dart';
import '../viewmodel/tattoo_view_model.dart';
import 'widgets/tattoo_prompt_input.dart';
import 'widgets/style_selector.dart';

class TattooView extends StatelessWidget {
  const TattooView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TattooViewModel(),
      child: const _TattooViewContent(),
    );
  }
}

class _TattooViewContent extends StatelessWidget {
  const _TattooViewContent();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TattooViewModel>();

    return GradientScaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Dövme Modu'),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: AppColors.primaryGradient,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'PRO',
                style: TextStyle(
                  color: AppColors.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TattooPromptInput(
              controller: viewModel.promptController,
              onSurpriseMe: viewModel.generateSurprisePrompt,
              onSubmitted: viewModel.generateTattoo,
            ),
            const SizedBox(height: 24),
            const Text(
              'Stiller',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            StyleSelector(
              selectedStyle: viewModel.selectedStyle,
              onStyleSelected: viewModel.selectStyle,
            ),
            const SizedBox(height: 24),
            const Text(
              'Örnekler',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemCount: viewModel.exampleImages.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: NetworkImage(viewModel.exampleImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () => viewModel.selectExample(index),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.5),
                              ],
                            ),
                          ),
                          child: const Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Dene',
                                style: TextStyle(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
