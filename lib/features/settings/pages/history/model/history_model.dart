// Geçmiş işlemleri için model
class HistoryItem {
  final String id;
  final String title;
  final String imageUrl;
  final DateTime createdAt;
  final String type; // işlem tipi (text-to-image, remBg vs.)

  HistoryItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.createdAt,
    required this.type,
  });
}
