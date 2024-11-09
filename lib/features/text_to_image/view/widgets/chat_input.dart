import 'package:flutter/material.dart';
import '../../../../core/constants/color_constants.dart';
import 'full_screen_input.dart';

class ChatInput extends StatefulWidget {
  final Function(String) onSend;
  final VoidCallback? onSurpriseMe;
  final VoidCallback? onAddImage;

  const ChatInput({
    super.key,
    required this.onSend,
    this.onSurpriseMe,
    this.onAddImage,
  });

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;
  final TextEditingController _textController = TextEditingController();
  double _dragStartY = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (details.primaryDelta! < 0) {
      // Yukarı sürükleme
      if (!_isExpanded) {
        setState(() {
          _isExpanded = true;
          _animationController.forward();
        });
      }
    } else if (details.primaryDelta! > 0) {
      // Aşağı sürükleme
      if (_isExpanded) {
        setState(() {
          _isExpanded = false;
          _animationController.reverse();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: _handleDragUpdate,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _isExpanded ? MediaQuery.of(context).size.height * 0.8 : null,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.vertical(
            top: const Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Draggable Handle
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            // Beni Şaşırt ve Görsel Ekle butonları
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {
                    final random = DateTime.now().millisecond % 8;
                    _textController.text = [
                      'Neon ışıklarıyla aydınlatılmış cyberpunk şehir manzarası',
                      'Mistik bir ormanın derinliklerinde dans eden periler',
                      'Steampunk tarzında mekanik bir ejderha',
                      'Uzay boşluğunda süzülen renkli baloncuklar içinde kelebekler',
                      'Antik bir tapınağın içinde meditasyon yapan robot keşişler',
                      'Kristal dağların arasında uçan fosforlu balinalar',
                      'Retro-fütüristik bir uzay istasyonunda günbatımı',
                      'Yağmurlu bir gecede neon tabelalar altında yürüyen samuray',
                    ][random];
                  },
                  icon: const Icon(Icons.casino, color: AppColors.primary),
                  label: const Text('Beni Şaşırt', style: TextStyle(color: AppColors.primary)),
                ),
                TextButton.icon(
                  onPressed: widget.onAddImage,
                  icon: const Icon(Icons.add_photo_alternate_outlined, color: AppColors.primary),
                  label: const Text('Görsel Ekle', style: TextStyle(color: AppColors.primary)),
                ),
              ],
            ),
            // Text Input
            Padding(
              padding: const EdgeInsets.all(16),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => FullScreenInput(
                      onSubmit: widget.onSend,
                      initialText: _textController.text,
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.5),
                      width: 2,
                    ),
                  ),
                  constraints: const BoxConstraints(minHeight: 80),
                  child: TextField(
                    controller: _textController,
                    enabled: false,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Görsel türü, obje, herhangi bir det...',
                      hintStyle: TextStyle(color: AppColors.textSecondary),
                    ),
                  ),
                ),
              ),
            ),
            if (_isExpanded) ...[
              // Genişletilmiş içerik
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Negatif Prompt
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: AppColors.primary.withOpacity(0.5),
                            ),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Negatif Prompt...',
                              hintStyle: TextStyle(color: AppColors.textSecondary),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Stiller
                      Container(
                        height: 100,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildStyleChip('Van Gogh'),
                            _buildStyleChip('Gerçekçi'),
                            _buildStyleChip('Fantastik'),
                            _buildStyleChip('Retro'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            // Alt Butonlar
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: _buildButton(
                      label: 'İleri',
                      onTap: () {},
                      isPrimary: false,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildButton(
                      label: 'Oluştur',
                      onTap: () => widget.onSend(_textController.text),
                      isPrimary: true,
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

  Widget _buildStyleChip(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(label),
        backgroundColor: AppColors.surface,
        side: BorderSide(color: AppColors.primary.withOpacity(0.5)),
      ),
    );
  }

  Widget _buildButton({
    required String label,
    required VoidCallback onTap,
    required bool isPrimary,
  }) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        gradient: isPrimary ? const LinearGradient(colors: AppColors.primaryGradient) : null,
        color: isPrimary ? null : AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: isPrimary ? null : Border.all(color: AppColors.primary.withOpacity(0.5)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isPrimary ? AppColors.onPrimary : AppColors.primary,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
