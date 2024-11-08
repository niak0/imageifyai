import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/text_to_image_view_model.dart';

class PromptInput extends StatelessWidget {
  const PromptInput({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TextToImageViewModel>();

    return TextField(
      onChanged: viewModel.setPrompt,
      decoration: const InputDecoration(
        hintText: 'Görseli tanımlayın...',
      ),
    );
  }
}
