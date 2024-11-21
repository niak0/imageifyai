import '../../../../../core/base/base_view_model.dart';
import '../model/history_model.dart';

class HistoryViewModel extends BaseViewModel {
  List<HistoryItem> _historyItems = [];
  List<HistoryItem> get historyItems => _historyItems;

  // Geçmiş işlemleri getir
  Future<void> fetchHistory() async {
    await handleAsync(() async {
      // Mock data
      _historyItems = [
        HistoryItem(
          id: '1',
          title: 'Uzaylı Kedi',
          type: HistoryType.textToImage,
          prompt: 'A cat in space suit on the moon',
          imageUrl: 'https://picsum.photos/200',
          createdAt: DateTime.now().subtract(const Duration(minutes: 5)),
          settings: {
            'stepCount': 30,
            'guidanceScale': 7.5,
          },
        ),
        HistoryItem(
          id: '2',
          title: 'Neon Şehir',
          type: HistoryType.textToImage,
          prompt: 'Cyberpunk city with neon lights',
          imageUrl: 'https://picsum.photos/201',
          createdAt: DateTime.now().subtract(const Duration(hours: 1)),
          settings: {
            'stepCount': 40,
            'guidanceScale': 8.0,
          },
        ),
        HistoryItem(
          id: '3',
          title: 'Fantastik Orman',
          type: HistoryType.textToImage,
          prompt: 'Magical forest with glowing mushrooms',
          imageUrl: 'https://picsum.photos/202',
          createdAt: DateTime.now().subtract(const Duration(days: 1)),
          settings: {
            'stepCount': 35,
            'guidanceScale': 7.0,
          },
        ),
        HistoryItem(
          id: '4',
          title: 'Retro Araba',
          type: HistoryType.removeBackground,
          prompt: 'Convert this car into retro style',
          imageUrl: 'https://picsum.photos/203',
          createdAt: DateTime.now().subtract(const Duration(days: 2)),
          settings: {
            'stepCount': 25,
            'guidanceScale': 6.5,
          },
        ),
        HistoryItem(
          id: '5',
          title: 'Steampunk Robot',
          type: HistoryType.upscaler,
          prompt: 'A steampunk robot drinking tea',
          imageUrl: 'https://picsum.photos/204',
          createdAt: DateTime.now().subtract(const Duration(days: 3)),
          settings: {
            'stepCount': 45,
            'guidanceScale': 8.5,
          },
        ),
      ];
    });
  }

  // Geçmiş işlemi sil
  Future<void> deleteHistoryItem(String id) async {
    await handleAsync(() async {
      _historyItems.removeWhere((item) => item.id == id);
      notifyListeners();
    });
  }

  // Tüm geçmişi temizle
  Future<void> clearHistory() async {
    await handleAsync(() async {
      _historyItems.clear();
      notifyListeners();
    });
  }

  // Yeni görüntü ekle
  Future<void> addHistoryItem(HistoryItem item) async {
    await handleAsync(() async {
      _historyItems.insert(0, item); // En başa ekle
      notifyListeners();
    });
  }
}
