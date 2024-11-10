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
    _messages.add(ChatMessage.bot(message: 'Hangi türde bir görsel oluşturmak istersiniz?'));
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
      await _addUserMessage();
      await _generateBotResponse();
      _clearInputs();
    });
  }

  Future<void> _addUserMessage() async {
    _messages.add(ChatMessage.user(textController.text));
    notifyListeners();
  }

  Future<void> _generateBotResponse() async {
    _messages.add(ChatMessage.loading());
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));
    _messages.removeLast();

    // API çağrısı burada olacak
    _messages.add(ChatMessage.bot(imageUrl: 'https://picsum.photos/400'));
    notifyListeners();
  }

  void _clearInputs() {
    textController.clear();
    negativePromptController.clear();
  }

  @override
  void dispose() {
    textController.dispose();
    negativePromptController.dispose();
    super.dispose();
  }
}
