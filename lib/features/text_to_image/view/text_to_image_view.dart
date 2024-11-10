import 'package:flutter/material.dart';
import 'package:imageifyai/core/components/buttons/app_button.dart';
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
      create: (_) => TextToImageViewModel(),
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
  static const double _bottomBarHeight = 80;

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
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
    );
  }

  Widget _buildMessageList(TextToImageViewModel viewModel) {
    return ListView.builder(
      controller: viewModel.scrollController,
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: 150,
      ),
      itemCount: viewModel.messages.length,
      itemBuilder: (context, index) => ChatMessageItem(message: viewModel.messages[index]),
    );
  }

  Widget _buildChatInput(TextToImageViewModel viewModel) {
    return GestureDetector(
      onVerticalDragUpdate: (details) => viewModel.handleDragUpdate(details.delta.dy),
      onVerticalDragEnd: (details) => viewModel.handleDragEnd(details.velocity.pixelsPerSecond.dy),
      child: Container(
        height: viewModel.currentHeight,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SingleChildScrollView(
          physics: viewModel.isExpanded ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
          child: ChatInput(viewModel: viewModel),
        ),
      ),
    );
  }

  Widget _buildBottomBar(TextToImageViewModel viewModel) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return Container(
      height: _bottomBarHeight + bottomPadding,
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + bottomPadding),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(
          top: BorderSide(color: AppColors.outline.withOpacity(0.1)),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: AppButton(
              type: AppButtonType.secondary,
              text: 'Detaylı Ayarla',
              onPressed: viewModel.toggleExpanded,
              rightIcon: viewModel.isExpanded ? Icons.arrow_downward : Icons.arrow_upward,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: AppButton(
              type: AppButtonType.primary,
              text: 'Oluştur',
              onPressed: viewModel.generateImage,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TextToImageViewModel>();

    return GradientScaffold(
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          _buildMessageList(viewModel),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildChatInput(viewModel),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(viewModel),
    );
  }
}
