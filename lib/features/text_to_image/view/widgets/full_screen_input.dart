import 'package:flutter/material.dart';
import '../../../../core/constants/color_constants.dart';

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
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          if (_hasText)
            TextButton(
              onPressed: () {
                widget.onSubmit(_controller.text);
                Navigator.pop(context);
              },
              child: const Text('Oluştur'),
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _controller,
                autofocus: true,
                maxLines: null,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Oluşturmak istediğiniz görseli detaylı bir şekilde anlatın...',
                  hintStyle: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(16),
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
                  if (!_hasText)
                    IconButton(
                      icon: const Icon(Icons.smart_toy_outlined),
                      color: AppColors.primary,
                      onPressed: widget.onSurpriseMe,
                    ),
                  const Spacer(),
                  Text(
                    '${_controller.text.length}/500',
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
