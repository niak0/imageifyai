import 'package:flutter/material.dart';

/// Tüm ViewModel'ler için temel sınıf.
/// Loading state, error handling ve async işlemleri yönetir.
abstract class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  /// Yükleme durumunu kontrol eder
  bool get isLoading => _isLoading;

  /// Hata mesajını tutar
  String? get errorMessage => _errorMessage;

  /// Yükleme durumunu günceller ve UI'ı bilgilendirir
  /// [value] yeni loading durumu
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// Hata mesajını günceller ve UI'ı bilgilendirir
  /// [message] gösterilecek hata mesajı
  void setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  /// Async işlemleri güvenli bir şekilde yönetir
  /// [operation] çalıştırılacak async işlem
  Future<void> handleAsync(Future<void> Function() operation) async {
    try {
      setLoading(true);
      await operation();
    } catch (e) {
      setError(e.toString());
    } finally {
      setLoading(false);
    }
  }
}

// Kullanım örneği:
// class TextToImageViewModel extends BaseViewModel {
//   Future<void> generateImage() async {
//     await handleAsync(() async {
//       // API çağrısı
//     });
//   }
// }
