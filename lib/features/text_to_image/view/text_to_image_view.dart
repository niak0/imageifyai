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
  double _minHeight = 230.0;
  double _maxHeight = 230.0;
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
            padding: EdgeInsets.only(bottom: _minHeight),
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

          // Sürüklenebilir Input Alanı
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                setState(() {
                  final newValue = _controller.value - (details.delta.dy / (_maxHeight - _minHeight));
                  _controller.value = newValue.clamp(0.0, 1.0);
                  _isExpanded = _controller.value > 0.5;
                });
              },
              onVerticalDragEnd: (details) {
                if (_controller.value > 0.5) {
                  _controller.animateTo(1.0);
                  setState(() => _isExpanded = true);
                } else {
                  _controller.animateTo(0.0);
                  setState(() => _isExpanded = false);
                }
              },
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  final height = _minHeight + (_maxHeight - _minHeight) * _controller.value;
                  return Container(
                    height: height,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, -2),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: ChatInput(
                        key: _chatInputKey,
                        onSend: viewModel.sendMessage,
                        onSurpriseMe: viewModel.generateSurprisePrompt,
                        onAddImage: () {
                          // Görsel ekleme işlevi
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Sabit Alt Butonlar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.surface.withOpacity(0.95),
                    AppColors.surface,
                  ],
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: SafeArea(
                top: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // İleri butonu işlevi
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.surface,
                            foregroundColor: AppColors.primary,
                            elevation: 8,
                            shadowColor: AppColors.primary.withOpacity(0.3),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(color: AppColors.primary),
                            ),
                          ),
                          icon: const Icon(Icons.arrow_forward),
                          label: const Text(
                            'İleri',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Oluştur butonu işlevi
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            elevation: 8,
                            shadowColor: AppColors.primary.withOpacity(0.3),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          icon: const Icon(Icons.create),
                          label: const Text(
                            'Oluştur',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
