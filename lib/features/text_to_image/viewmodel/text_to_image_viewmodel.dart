import 'package:imageifyai/features/text_to_image/model/chat_message.dart';

import '../../../core/base/base_view_model.dart';
import '../model/image_options.dart';

class TextToImageViewModel extends BaseViewModel {
  final List<ChatMessage> _messages = [];
  List<ChatMessage> get messages => _messages;

  bool _showStyleSelector = false;
  bool get showStyleSelector => _showStyleSelector;

  Styles? _selectedStyle;
  Styles? get selectedStyle => _selectedStyle;

  void sendMessage(String text) {
    // Kullanıcı mesajını ekle
    _messages.insert(
        0,
        ChatMessage(
          message: text,
          type: MessageType.user,
        ));

    // Bot yanıtını ekle
    _messages.insert(
        0,
        ChatMessage(
          message: 'Görseliniz hazırlanıyor...',
          type: MessageType.bot,
          isLoading: true,
        ));

    notifyListeners();

    // TODO: API çağrısı yapılacak
  }

  void selectStyle(Styles style) {
    _selectedStyle = style;
    _showStyleSelector = false;
    notifyListeners();
  }

  void toggleStyleSelector() {
    _showStyleSelector = !_showStyleSelector;
    notifyListeners();
  }

  void generateSurprisePrompt() {
    // TODO: Rastgele prompt üret
  }
}
