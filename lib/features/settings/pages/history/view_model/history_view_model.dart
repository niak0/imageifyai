import 'package:flutter/material.dart';
import '../model/history_model.dart';

class HistoryViewModel extends ChangeNotifier {
  List<HistoryItem> _historyItems = [];
  bool _isLoading = false;

  List<HistoryItem> get historyItems => _historyItems;
  bool get isLoading => _isLoading;

  // Geçmiş işlemleri getir
  Future<void> fetchHistory() async {
    _isLoading = true;
    notifyListeners();

    try {
      // TODO: API'den geçmiş işlemleri çek
      await Future.delayed(const Duration(seconds: 1)); // Simülasyon
      _historyItems = []; // API'den gelen veriler ile doldurulacak
    } catch (e) {
      debugPrint('Error fetching history: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Geçmiş işlemi sil
  Future<void> deleteHistoryItem(String id) async {
    try {
      // TODO: API'den silme işlemi
      _historyItems.removeWhere((item) => item.id == id);
      notifyListeners();
    } catch (e) {
      debugPrint('Error deleting history item: $e');
    }
  }
}
