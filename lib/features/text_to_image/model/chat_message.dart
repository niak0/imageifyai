enum MessageType { user, bot }

class ChatMessage {
  final String message;
  final MessageType type;
  final String? imageUrl;
  final DateTime timestamp;
  final bool isLoading;
  final bool isError;

  ChatMessage({
    required this.message,
    required this.type,
    this.imageUrl,
    DateTime? timestamp,
    this.isLoading = false,
    this.isError = false,
  }) : timestamp = timestamp ?? DateTime.now();

  // Kullanıcı mesajı oluşturmak için factory
  factory ChatMessage.user(String message) {
    return ChatMessage(
      message: message,
      type: MessageType.user,
    );
  }

  // Bot mesajı oluşturmak için factory
  factory ChatMessage.bot({
    required String message,
    String? imageUrl,
    bool isLoading = false,
    bool isError = false,
  }) {
    return ChatMessage(
      message: message,
      type: MessageType.bot,
      imageUrl: imageUrl,
      isLoading: isLoading,
      isError: isError,
    );
  }

  // Loading durumunda bot mesajı
  factory ChatMessage.loading() {
    return ChatMessage(
      message: 'Görsel oluşturuluyor...',
      type: MessageType.bot,
      isLoading: true,
    );
  }

  // Hata durumunda bot mesajı
  factory ChatMessage.error(String errorMessage) {
    return ChatMessage(
      message: errorMessage,
      type: MessageType.bot,
      isError: true,
    );
  }

  // Mesajın kopyasını oluşturmak için
  ChatMessage copyWith({
    String? message,
    MessageType? type,
    String? imageUrl,
    DateTime? timestamp,
    bool? isLoading,
    bool? isError,
  }) {
    return ChatMessage(
      message: message ?? this.message,
      type: type ?? this.type,
      imageUrl: imageUrl ?? this.imageUrl,
      timestamp: timestamp ?? this.timestamp,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
    );
  }
}
