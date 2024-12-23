import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/colors.dart';
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

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.card,
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Dövme Modu'),
              Text(
                'PRO',
                style: TextStyle(
                  color: AppColors.text,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
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
                    color: AppColors.text,
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
                    color: AppColors.text,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1,
                  ),
                  itemCount: viewModel.examples.length,
                  itemBuilder: (context, index) {
                    final example = viewModel.examples[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: NetworkImage(example.imageUrl),
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
                                    color: AppColors.text,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
