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
  double _currentHeight = 200;
  static const double _minHeight = 200;
  static const double _maxHeight = 600;
  static const double _bottomBarHeight = 80; // BottomNavigationBar yüksekliği

  double get _expandRatio => (_currentHeight - _minHeight) / (_maxHeight - _minHeight);

  void _handleDragUpdate(DragUpdateDetails details) {
    setState(() {
      _currentHeight = (_currentHeight - details.delta.dy).clamp(_minHeight, _maxHeight);
    });
  }

  void _handleDragEnd(DragEndDetails details) {
    final shouldExpand = _expandRatio > 0.5;
    setState(() {
      _currentHeight = shouldExpand ? _maxHeight : _minHeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TextToImageViewModel>();
    final bottomPadding = MediaQuery.of(context).padding.bottom;

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
          ListView.builder(
            reverse: true,
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: _minHeight, // BottomBar ve Input için padding
            ),
            itemCount: viewModel.messages.length,
            itemBuilder: (context, index) {
              final message = viewModel.messages[index];
              return ChatMessageItem(message: message);
            },
          ),

          // Chat Input
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onVerticalDragUpdate: _handleDragUpdate,
              onVerticalDragEnd: _handleDragEnd,
              child: Container(
                height: _currentHeight,
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
                  // Overflow'u engellemek için
                  physics: const NeverScrollableScrollPhysics(),
                  child: ChatInput(
                    expandRatio: _expandRatio,
                    onSend: viewModel.sendMessage,
                    onSurpriseMe: viewModel.generateSurprisePrompt,
                    onAddImage: () {
                      // Görsel ekleme işlevi
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: _bottomBarHeight + bottomPadding,
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + bottomPadding),
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border(
            top: BorderSide(
              color: AppColors.outline.withOpacity(0.1),
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // İleri butonu işlevi
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.surface,
                  foregroundColor: AppColors.primary,
                  elevation: 8,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: AppColors.primary),
                  ),
                ),
                child: const Text(
                  'İleri',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Oluştur butonu işlevi
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 8,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Oluştur',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
