import 'package:flutter/material.dart';
import '../../../../product/tokens/colors.dart';

class FullScreenInput extends StatefulWidget {
  final String? initialText;
  final Function(String) onSubmit;
  final VoidCallback? onSurpriseMe;

  const FullScreenInput({
    super.key,
    this.initialText,
    required this.onSubmit,
    this.onSurpriseMe,
  });

  @override
  State<FullScreenInput> createState() => _FullScreenInputState();
}

class _FullScreenInputState extends State<FullScreenInput> {
  late final TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
    _controller.addListener(_updateHasText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: SafeArea(
        child: Column(
          children: [
            // Custom AppBar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.outline.withOpacity(0.1),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      widget.onSubmit(_controller.text);
                    },
                    child: const Text(
                      'Kapat',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    '${_controller.text.length}/500',
                    style: const TextStyle(
                      color: AppColors.textLow,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _controller.clear();
                      setState(() {});
                    },
                    child: const Text(
                      'Tümünü Temizle',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Content
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'İstem Girin',
                      style: TextStyle(
                        color: AppColors.text,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: _controller,
                      autofocus: true,
                      maxLines: null,
                      enabled: true,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (value) {
                        widget.onSubmit(value);
                      },
                      style: const TextStyle(
                        color: AppColors.textLow,
                        fontSize: 16,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Görsel türü, obje, herhangi bir detay',
                        hintStyle: TextStyle(
                          color: AppColors.textLow,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const Text(
                      'Örn: Şapkalı bir kedi portresi',
                      style: TextStyle(
                        color: AppColors.textLow,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Etiket Paketleri
            Container(
              height: 120,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Etiket Paketleri',
                      style: TextStyle(
                        color: AppColors.textLow,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        _buildStyleCard('Van Gogh'),
                        _buildStyleCard('Gerçekçi'),
                        _buildStyleCard('Fantastik'),
                        _buildStyleCard('Retro'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStyleCard(String title) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: NetworkImage('https://picsum.photos/200'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.7),
            ],
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _updateHasText() {
    final hasText = _controller.text.isNotEmpty;
    if (hasText != _hasText) {
      setState(() {
        _hasText = hasText;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
