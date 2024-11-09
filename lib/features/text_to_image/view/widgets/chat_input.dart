import 'package:flutter/material.dart';
import 'package:imageifyai/core/services/navigation_service.dart';
import 'package:imageifyai/features/text_to_image/view/widgets/full_screen_input.dart';
import '../../../../core/constants/color_constants.dart';

class ChatInput extends StatefulWidget {
  final Function(String) onSend;
  final VoidCallback? onSurpriseMe;
  final VoidCallback? onAddImage;
  final VoidCallback? onClose;

  const ChatInput({
    super.key,
    required this.onSend,
    this.onSurpriseMe,
    this.onAddImage,
    this.onClose,
  });

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Handle
        Center(
          child: Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),

        // Üst Butonlar
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: widget.onSurpriseMe,
              icon: const Icon(Icons.casino, color: AppColors.primary),
              label: const Text(
                'Beni Şaşırt',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 16,
                ),
              ),
            ),
            TextButton.icon(
              onPressed: widget.onAddImage,
              icon: const Icon(Icons.add_photo_alternate_outlined, color: AppColors.primary),
              label: const Text(
                'Görsel Ekle',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),

        // Ana İstem Input Alanı
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.primary.withOpacity(0.5),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              NavigationService().navigateToPage(FullScreenInput(
                initialText: _textController.text,
                onSubmit: (value) {
                  setState(() {
                    _textController.text = value;
                  });
                },
              ));
            },
            child: TextField(
              controller: _textController,
              enabled: false,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'İstem Girin',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),

        // Negatif İstem Input Alanı
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextField(
            enabled: false,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Negatif İstem Girin',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
        ),

        // Stil Seçin Text
        const Text(
          'Stil Seçin',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),

        // Stil Seçenekleri
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                width: 80,
                height: 80,
                margin: const EdgeInsets.only(right: 12, top: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: index == 0 ? AppColors.primary : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://picsum.photos/80', // Örnek görsel URL'si
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),

        // Görsel Oranı
        const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text(
            'Görsel Oranı:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        // Görsel Oranı Seçenekleri
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '1:1',
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '2:3',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
