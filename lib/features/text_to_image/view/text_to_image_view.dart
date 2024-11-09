import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/color_constants.dart';
import 'package:imageifyai/core/widgets/gradient_scaffold.dart';
import 'package:imageifyai/features/text_to_image/viewmodel/text_to_image_view_model.dart';
import 'package:provider/provider.dart';
import 'widgets/chat_input.dart';
import 'widgets/chat_message_item.dart';

class TextToImageView extends StatelessWidget {
  const TextToImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TextToImageViewModel()..initialize(),
      child: const _TextToImageContent(),
    );
  }
}

class _TextToImageContent extends StatefulWidget {
  const _TextToImageContent();

  @override
  State<_TextToImageContent> createState() => _TextToImageContentState();
}

class _TextToImageContentState extends State<_TextToImageContent> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isExpanded = false;
  double _minHeight = 150.0;
  double _maxHeight = 150.0;
  final GlobalKey _chatInputKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateMaxHeight();
    });
  }

  void _updateMaxHeight() {
    final RenderBox? renderBox = _chatInputKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      setState(() {
        _maxHeight = renderBox.size.height;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TextToImageViewModel>();

    return GradientScaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Sanat Oluşturucu'),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: AppColors.primaryGradient),
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
      body: Stack(
        children: [
          // Mesajlar Listesi
          Padding(
            padding: EdgeInsets.only(bottom: _minHeight + 80),
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(16),
              itemCount: viewModel.messages.length,
              itemBuilder: (context, index) {
                final message = viewModel.messages[index];
                return ChatMessageItem(message: message);
              },
            ),
          ),

          // Chat Input
          ChatInput(
            key: _chatInputKey,
            onSend: viewModel.sendMessage,
            onSurpriseMe: viewModel.generateSurprisePrompt,
            onAddImage: () {
              // Görsel ekleme işlevi
            },
            height: _minHeight + (_maxHeight - _minHeight) * _controller.value,
            isExpanded: _isExpanded,
            onDragUpdate: (details) {
              setState(() {
                final newValue = _controller.value - (details.delta.dy / (_maxHeight - _minHeight));
                _controller.value = newValue.clamp(0.0, 1.0);
                _isExpanded = _controller.value > 0.5;
              });
            },
            onDragEnd: (details) {
              if (_controller.value > 0.5) {
                _controller.animateTo(1.0);
                setState(() => _isExpanded = true);
              } else {
                _controller.animateTo(0.0);
                setState(() => _isExpanded = false);
              }
            },
          ),
        ],
      ),
    );
  }
}
