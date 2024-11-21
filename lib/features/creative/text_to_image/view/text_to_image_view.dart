import 'package:flutter/material.dart';
import 'package:imageifyai/core/extensions/glow_extensions.dart';
import 'package:imageifyai/core/styles/decorations.dart';
import 'package:imageifyai/core/constants/colors.dart';
import 'package:imageifyai/features/creative/text_to_image/viewmodel/text_to_image_view_model.dart';
import 'package:imageifyai/features/settings/pages/history/view_model/history_view_model.dart';
import 'package:provider/provider.dart';
import 'widgets/chat_input.dart';
import 'widgets/chat_message_item.dart';

class TextToImageView extends StatelessWidget {
  const TextToImageView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final historyViewModel = HistoryViewModel();
        return TextToImageViewModel(historyViewModel: historyViewModel);
      },
      child: const _TextToImageContent(),
    );
  }
}

class _TextToImageContent extends StatefulWidget {
  const _TextToImageContent();

  @override
  State<_TextToImageContent> createState() => _TextToImageContentState();
}

class _TextToImageContentState extends State<_TextToImageContent> {
  late final ScrollController scrollController;
  late final DraggableScrollableController dragController;

  // Sabit değerler
  static const double _minSheetSize = 0.29;
  static const double _maxSheetSize = 0.8;
  static const double _expandThreshold = 0.5;
  static const List<double> snapSizes = [_minSheetSize, _maxSheetSize];

  double sheetSize = _minSheetSize;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    // Sheet'in durumunu dinle
    dragController = DraggableScrollableController();
    dragController.addListener(_onSheetChanged);
  }

  @override
  void dispose() {
    scrollController.dispose();
    dragController.dispose();
    super.dispose();
  }

  /// Bu metot, alt sayfanın boyutunu ve genişletilmiş durumunu günceller.
  /// DraggableScrollableController'ın boyutunu alır ve setState ile
  /// sheetSize ve isExpanded değişkenlerini günceller.
  void _onSheetChanged() {
    setState(() {
      sheetSize = dragController.size;
      isExpanded = sheetSize > _expandThreshold;
    });
  }

  /// Bu metot, alt sayfanın genişletilmiş veya daraltılmış durumunu değiştirir.
  /// Eğer sayfa genişletilmişse, daraltılmış duruma geçer.
  /// Eğer sayfa daraltılmışsa, genişletilmiş duruma geçer.
  void handleToggleExpand() async {
    final targetSize = isExpanded ? _minSheetSize : _maxSheetSize;
    await dragController.animateTo(
      targetSize,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TextToImageViewModel>();
    final screenHeight = MediaQuery.of(context).size.height;
    final bottomPadding = screenHeight * sheetSize * 0.9;

    return Scaffold(
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: bottomPadding),
            child: _buildMessageList(viewModel),
          ),
          _buildChatInput(viewModel),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Sanat Oluşturucu'),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: AppColors.backgroundDecoration),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'PRO',
              style: TextStyle(
                color: AppColors.text,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList(TextToImageViewModel viewModel) {
    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.only(left: 16, right: 16),
      itemCount: viewModel.messages.length,
      itemBuilder: (context, index) => ChatMessageItem(message: viewModel.messages[index]),
    );
  }

  Widget _buildChatInput(TextToImageViewModel viewModel) {
    return DraggableScrollableSheet(
      controller: dragController,
      initialChildSize: _minSheetSize,
      minChildSize: _minSheetSize,
      maxChildSize: _maxSheetSize,
      snap: true,
      snapSizes: snapSizes,
      builder: (context, scrollController) {
        return Container(
          decoration: AppDecorations.baseContainer.withGlowEffect(glowColor: AppColors.onCard, intenseGlow: false),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: ChatInput(viewModel: viewModel),
                ),
              ),
              _buildBottomButtons(viewModel),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomButtons(TextToImageViewModel viewModel) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                icon: const Icon(Icons.arrow_upward),
                label: const Text('Detaylı Ayarla'),
                onPressed: handleToggleExpand,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('Oluştur'),
                onPressed: viewModel.generateImage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
