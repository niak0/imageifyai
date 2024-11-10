import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RemoveBackgroundViewModel extends ChangeNotifier {
  File? _selectedImage;
  File? _resultImage;
  bool _isLoading = false;
  String? _error;

  File? get selectedImage => _selectedImage;
  File? get resultImage => _resultImage;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasResult => _resultImage != null;

  Future<void> pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
        _resultImage = null;
        _error = null;
        notifyListeners();
      }
    } catch (e) {
      _error = 'Resim seçilirken bir hata oluştu';
      notifyListeners();
    }
  }

  Future<void> removeBackground() async {
    if (_selectedImage == null) return;

    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // TODO: API entegrasyonu yapılacak
      // Örnek bekleme süresi
      await Future.delayed(const Duration(seconds: 2));

      // TODO: API'den dönen sonuç işlenecek
      _resultImage = _selectedImage; // Geçici olarak aynı resmi kullanıyoruz
    } catch (e) {
      _error = 'Arka plan kaldırılırken bir hata oluştu';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> downloadResult() async {
    if (_resultImage == null) return;

    try {
      _isLoading = true;
      notifyListeners();

      // TODO: İndirme işlemi implementasyonu yapılacak
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      _error = 'Resim indirilirken bir hata oluştu';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void reset() {
    _selectedImage = null;
    _resultImage = null;
    _error = null;
    _isLoading = false;
    notifyListeners();
  }
}
