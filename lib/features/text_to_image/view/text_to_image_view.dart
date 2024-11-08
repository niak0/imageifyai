import 'package:flutter/material.dart';
import 'package:imageifyai/core/widgets/gradient_scaffold.dart';
import 'package:imageifyai/features/text_to_image/view/widgets/quality_selector.dart';
import 'package:imageifyai/features/text_to_image/view/widgets/size_selector.dart';
import 'package:imageifyai/features/text_to_image/view/widgets/style_selector.dart';
import 'package:imageifyai/features/text_to_image/view/widgets/styles_section.dart';
import 'package:provider/provider.dart';
import '../viewmodel/text_to_image_view_model.dart';
import 'widgets/prompt_input.dart';
import '../../../core/components/buttons/app_button.dart';

class TextToImageView extends StatelessWidget {
  const TextToImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TextToImageViewModel(),
      child: _TextToImageContent(),
    );
  }
}

class _TextToImageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: AppBar(
        title: const Text('Görsel Oluştur'),
        centerTitle: true,
      ),
      body: Consumer<TextToImageViewModel>(
        builder: (context, viewModel, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PromptInput(),
                const SizedBox(height: 16),
                const StyleSelector(),
                const StylesSection(),
                const SizedBox(height: 16),
                const SizeSelector(),
                const SizedBox(height: 16),
                const QualitySelector(),
                const Spacer(),
                AppButton(
                  text: 'Görsel Oluştur',
                  onPressed: viewModel.canGenerate ? viewModel.generateImage : null,
                  type: AppButtonType.primary,
                  size: AppButtonSize.large,
                  isFullWidth: true,
                  isLoading: viewModel.isLoading,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
