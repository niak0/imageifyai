import 'package:flutter/material.dart';
import 'package:imageifyai/features/creative/text_to_image/model/chat_message.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/colors.dart';

class ChatMessageItem extends StatelessWidget {
  final ChatMessage message;

  const ChatMessageItem({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final isUser = message.type == MessageType.user;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser) _buildAvatar(),
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isUser ? AppColors.primary.withOpacity(0.2) : AppColors.surface,
                borderRadius: BorderRadius.circular(AppConstants.cardBorderRadius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  message.message != null
                      ? Text(
                          message.message ?? '',
                        )
                      : const SizedBox.shrink(),
                  if (message.imageUrl != null) ...[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        message.imageUrl!,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                  if (message.isLoading) ...[
                    const SizedBox(height: 8),
                    const CircularProgressIndicator(),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          if (isUser) _buildAvatar(),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      backgroundColor: message.type == MessageType.user ? AppColors.primary.withOpacity(0.2) : AppColors.surface,
      child: Icon(
        message.type == MessageType.user ? Icons.person : Icons.smart_toy,
        color: message.type == MessageType.user ? AppColors.text : AppColors.primary,
      ),
    );
  }
}
