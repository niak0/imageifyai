import 'package:flutter/material.dart';
import 'package:imageifyai/core/components/buttons/app_button.dart';
import 'package:imageifyai/core/constants/color_constants.dart';
import 'package:imageifyai/core/theme/app_styles.dart';
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
      create: (_) => TextToImageViewModel(context),
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
      reverse: false,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: viewModel.currentHeight,
      ),
      itemCount: viewModel.messages.length,
      itemBuilder: (context, index) => ChatMessageItem(message: viewModel.messages[index]),
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: false,
    );
  }

  Widget _buildChatInput(TextToImageViewModel viewModel) {
    return GestureDetector(
      onVerticalDragUpdate: (details) => viewModel.handleDragUpdate(details.delta.dy),
      onVerticalDragEnd: (details) => viewModel.handleDragEnd(details.velocity.pixelsPerSecond.dy),
      child: Container(
        height: viewModel.currentHeight,
        decoration: AppStyles.containerGradientDecoration,
        child: SingleChildScrollView(
          physics: viewModel.isExpanded ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
          child: ChatInput(viewModel: viewModel),
        ),
      ),
    );
  }

  Widget _buildBottomBar(TextToImageViewModel viewModel) {
    return Container(
      decoration: AppStyles.containerGradientDecoration,
      child: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ),
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
