import 'package:flutter/material.dart';
import 'package:imageifyai/features/text_to_image/model/chat_message.dart';
import '../../../../core/constants/color_constants.dart';

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
                color: isUser ? AppColors.primary : AppColors.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.message,
                    style: TextStyle(
                      color: isUser ? AppColors.onPrimary : AppColors.textPrimary,
                    ),
                  ),
                  if (message.imageUrl != null) ...[
                    const SizedBox(height: 8),
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
      backgroundColor: message.type == MessageType.user ? AppColors.primary : AppColors.surface,
      child: Icon(
        message.type == MessageType.user ? Icons.person : Icons.smart_toy,
        color: message.type == MessageType.user ? AppColors.onPrimary : AppColors.primary,
      ),
    );
  }
}
