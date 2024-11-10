import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:imageifyai/core/services/image_service.dart';
import '../../../core/base/base_view_model.dart';

import '../model/chat_message.dart';
import 'package:flutter/material.dart';

import '../model/image_style.dart';
import '../model/image_aspect_ratio.dart';

class TextToImageViewModel extends BaseViewModel {
  final TextEditingController textController = TextEditingController();
  final TextEditingController negativePromptController = TextEditingController();
  final ImageService _imageService = ImageService();
  File? selectedImage;
  final ScrollController scrollController = ScrollController();

  static const double minHeight = 150;
  static const double maxHeight = 600;

  double _currentHeight = minHeight;
  double get currentHeight => _currentHeight;

  bool _isExpanded = false;
  bool get isExpanded => _isExpanded;

  final List<ChatMessage> _messages = [];
  List<ChatMessage> get messages => List.unmodifiable(_messages);

  // Stil seçimi için
  final List<ImageStyle> styles = ImageStyle.allValues;
  ImageStyle? _selectedStyle;
  ImageStyle? get selectedStyle => _selectedStyle;

  // Görsel oranı için
  final List<ImageAspectRatio> aspectRatios = ImageAspectRatio.ratios;
  ImageAspectRatio _selectedAspectRatio = ImageAspectRatio.ratios.first;
  ImageAspectRatio get selectedAspectRatio => _selectedAspectRatio;

  TextToImageViewModel() {
    _messages.add(ChatMessage.bot(message: 'Merhaba, ben Imageify! Size nasıl yardımcı olabilirim?'));
    _messages.add(ChatMessage.bot(message: 'Merhaba, ben Imageify! Size nasıl yardımcı olabilirim?'));
  }
  void _scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void handleDragUpdate(double delta) {
    _currentHeight = (_currentHeight - delta).clamp(minHeight, maxHeight);
    _isExpanded = _currentHeight > minHeight + 50;
    notifyListeners();
  }

  void handleDragEnd(double velocity) {
    final shouldExpand = _currentHeight > (maxHeight + minHeight) / 2;
    setExpanded(shouldExpand);
  }

  void setExpanded(bool value) {
    _isExpanded = value;
    _currentHeight = value ? maxHeight : minHeight;
    notifyListeners();
  }

  void toggleExpanded() {
    setExpanded(!_isExpanded);
  }

  void selectStyle(ImageStyle style) {
    _selectedStyle = style;
    notifyListeners();
  }

  void selectAspectRatio(ImageAspectRatio ratio) {
    _selectedAspectRatio = ratio;
    notifyListeners();
  }

  Future<void> handleImageAdd(BuildContext context) async {
    if (selectedImage != null) {
      selectedImage = null;
      notifyListeners();
      return;
    }

    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Galeriden Seç'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Kamera ile Çek'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
          ],
        ),
      ),
    );

    if (source != null) {
      final image = await _imageService.pickImage(source);
      if (image != null) {
        selectedImage = File(image);
        notifyListeners();
      }
    }
  }

  void handleSurpriseMe() {
    final random = DateTime.now().millisecond % 8;
    textController.text = [
      'Neon ışıklarıyla aydınlatılmış cyberpunk şehir manzarası',
      'Mistik bir ormanın derinliklerinde dans eden periler',
      'Steampunk tarzında mekanik bir ejderha',
      'Uzay boşluğunda süzülen renkli baloncuklar içinde kelebekler',
      'Antik bir tapınağın içinde meditasyon yapan robot keşişler',
      'Kristal dağların arasında uçan fosforlu balinalar',
      'Retro-fütüristik bir uzay istasyonunda günbatımı',
      'Yağmurlu bir gecede neon tabelalar altında yürüyen samuray',
    ][random];
    notifyListeners();
  }

  Future<void> generateImage() async {
    if (textController.text.isEmpty) return;

    await handleAsync(() async {
      _messages.add(ChatMessage.user(
        textController.text,
      ));
      notifyListeners();
      _scrollToBottom();

      _messages.add(ChatMessage.loading());
      notifyListeners();
      _scrollToBottom();

      await Future.delayed(const Duration(seconds: 2));

      _messages.removeLast();
      _messages.add(ChatMessage.bot(
        message: 'İşte oluşturduğum görsel:',
        imageUrl: 'https://picsum.photos/400',
      ));
      notifyListeners();
      _scrollToBottom();

      textController.clear();
      negativePromptController.clear();
      setExpanded(false);
    });
  }

  @override
  void dispose() {
    textController.dispose();
    negativePromptController.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
