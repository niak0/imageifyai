enum HistoryType {
  textToImage,
  removeBackground,
  upscaler,
}

class HistoryItem {
  final String id;
  final String title;
  final HistoryType type;
  final String prompt;
  final String imageUrl;
  final DateTime createdAt;
  final Map<String, dynamic> settings; // AI ayarları

  const HistoryItem({
    required this.id,
    required this.title,
    required this.type,
    required this.prompt,
    required this.imageUrl,
    required this.createdAt,
    required this.settings,
  });

  // JSON serialization için factory constructor
  factory HistoryItem.fromJson(Map<String, dynamic> json) {
    return HistoryItem(
      id: json['id'] as String,
      title: json['title'] as String,
      type: HistoryType.values.byName(json['type'] as String),
      prompt: json['prompt'] as String,
      imageUrl: json['imageUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      settings: json['settings'] as Map<String, dynamic>,
    );
  }

  // JSON serialization için toJson metodu
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'type': type.name,
      'prompt': prompt,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toIso8601String(),
      'settings': settings,
    };
  }
}
