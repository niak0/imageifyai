import 'package:flutter/material.dart';

/// Tüm ViewModel'ler için temel sınıf.
abstract class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  /// Yükleme durumunu günceller ve UI'ı bilgilendirir
  @protected
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// Hata mesajını günceller ve UI'ı bilgilendirir
  @protected
  void setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  /// [operation] çalıştırılacak async işlem
  @protected
  Future<void> handleAsync(Future<void> Function() operation) async {
    try {
      _isLoading = true;
      notifyListeners();
      await operation();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
