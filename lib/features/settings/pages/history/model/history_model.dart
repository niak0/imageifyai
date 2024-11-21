// Geçmiş işlemleri için model
class HistoryItem {
  final String id;
  final String title;
  final String imageUrl;
  final DateTime createdAt;
  final String type; // işlem tipi (text-to-image, remBg vs.)

  const HistoryItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.createdAt,
    required this.type,
  });

  // JSON serialization için factory constructor
  factory HistoryItem.fromJson(Map<String, dynamic> json) {
    return HistoryItem(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      type: json['type'] as String,
    );
  }

  // JSON serialization için toJson metodu
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toIso8601String(),
      'type': type,
    };
  }
}
