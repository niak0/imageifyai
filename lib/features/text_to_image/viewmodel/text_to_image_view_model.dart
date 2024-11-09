import '../../../core/base/base_view_model.dart';
import '../../../core/services/api_service.dart';
import '../../../core/services/cache_service.dart';
import '../model/chat_message.dart';

class TextToImageViewModel extends BaseViewModel {
  final ApiService _apiService = ApiService();
  final CacheService _cacheService = CacheService();

  final List<ChatMessage> _messages = [];
  List<ChatMessage> get messages => List.unmodifiable(_messages);

  // Örnek sürpriz promptlar
  final List<String> _surprisePrompts = [
    'Neon ışıklarıyla aydınlatılmış cyberpunk şehir manzarası',
    'Mistik bir ormanın derinliklerinde dans eden periler',
    'Steampunk tarzında mekanik bir ejderha',
    'Uzay boşluğunda süzülen renkli baloncuklar içinde kelebekler',
    'Antik bir tapınağın içinde meditasyon yapan robot keşişler',
    'Kristal dağların arasında uçan fosforlu balinalar',
    'Retro-fütüristik bir uzay istasyonunda günbatımı',
    'Yağmurlu bir gecede neon tabelalar altında yürüyen samuray',
  ];

  void initialize() {
    // Başlangıç mesajını ekle
    _messages.add(
      ChatMessage.bot(
        message: 'Merhaba! 👋 Ben AI Asistanınızım. Oluşturmak istediğiniz görsel hakkında bana bilgi verebilir misiniz?',
      ),
    );
    notifyListeners();
  }

  Future<void> sendMessage(String message) async {
    if (message.trim().isEmpty) return;

    // Kullanıcı mesajını ekle
    _messages.add(ChatMessage.user(message));
    notifyListeners();

    await handleAsync(() async {
      try {
        // Loading mesajını ekle
        final loadingMessage = ChatMessage.loading();
        _messages.add(loadingMessage);
        notifyListeners();

        // Cache'den kontrol et
        final cachedImage = _cacheService.getCachedImage(message);
        if (cachedImage != null) {
          _messages.remove(loadingMessage);
          _messages.add(ChatMessage.bot(
            message: 'İşte sizin için oluşturduğum görsel:',
            imageUrl: cachedImage,
          ));
          return;
        }

        // API isteği
        final response = await _apiService.post(
          '/generate-image',
          body: {'prompt': message},
        );

        // Loading mesajını kaldır
        _messages.remove(loadingMessage);

        // Yanıtı ekle
        _messages.add(ChatMessage.bot(
          message: 'İşte sizin için oluşturduğum görsel:',
          imageUrl: response['image_url'],
        ));

        // Cache'e kaydet
        await _cacheService.cacheImage(message, response['image_url']);
      } catch (e) {
        _messages.add(ChatMessage.error(
          'Görsel oluşturulurken bir hata oluştu. Lütfen tekrar deneyin.',
        ));
        rethrow;
      }
    });
  }

  void generateSurprisePrompt() {
    final random = _surprisePrompts[DateTime.now().millisecond % _surprisePrompts.length];
    sendMessage(random);
  }

  void clearMessages() {
    _messages.clear();
    initialize(); // Başlangıç mesajını tekrar ekle
    notifyListeners();
  }

  // Görseli indirme
  Future<void> downloadImage(String imageUrl) async {
    await handleAsync(() async {
      try {
        // await _cacheService.downloadImage(imageUrl);
      } catch (e) {
        throw Exception('Görsel indirilirken bir hata oluştu: $e');
      }
    });
  }

  // Görseli paylaşma
  Future<void> shareImage(String imageUrl) async {
    await handleAsync(() async {
      try {
        // TODO: Paylaşım işlemi
      } catch (e) {
        throw Exception('Görsel paylaşılırken bir hata oluştu: $e');
      }
    });
  }

  @override
  void dispose() {
    _messages.clear();
    super.dispose();
  }
}
