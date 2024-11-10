import 'dart:io';

import 'package:imageifyai/core/services/image_service.dart';
import 'package:imageifyai/core/utils/image_picker_dialog.dart';
import 'package:imageifyai/features/text_to_image/constants/prompt_constants.dart';
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

  late final double minHeight;
  late double maxHeight; // artık final değil

  late double _currentHeight;
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

  TextToImageViewModel(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    minHeight = screenHeight * 0.17; // Ekranın %17'si
    _currentHeight = minHeight; // İlk değer minHeight olarak ayarlandı
    _messages.add(ChatMessage.bot(message: 'Merhaba, ben Imageify! Size nasıl yardımcı olabilirim?'));
    _messages.add(ChatMessage.bot(message: 'Merhaba, ben Imageify! Size nasıl yardımcı olabilirim?'));
  }
  // Yeni metod: ChatInput'tan gelen yüksekliği set eder
  void updateMaxHeight(double contentHeight) {
    maxHeight = contentHeight;
    // Eğer current height maxHeight'tan büyükse güncelle
    if (_currentHeight > maxHeight) {
      _currentHeight = maxHeight;
      notifyListeners();
    }
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
    _isExpanded = _currentHeight > minHeight + 100;
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

    final source = await ImagePickerDialog.show(context);

    if (source != null) {
      final image = await _imageService.pickImage(source);
      if (image != null) {
        selectedImage = File(image);
        notifyListeners();
      }
    }
  }

  void handleSurpriseMe() {
    final random = DateTime.now().millisecond % PromptConstants.samplePrompts.length;
    textController.text = PromptConstants.samplePrompts[random];
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
