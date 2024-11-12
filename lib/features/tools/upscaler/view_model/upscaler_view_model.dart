import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:imageifyai/core/base/base_view_model.dart';

class UpscalerViewModel extends BaseViewModel {
  File? _selectedImage;
  File? _resultImage;
  String? _error;

  File? get selectedImage => _selectedImage;
  File? get resultImage => _resultImage;
  String? get error => _error;

  Future<void> pickImage(ImageSource source) async {
    try {
      setLoading(true);

      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
        _resultImage = null;
        _error = null;
      }
    } catch (e) {
      _error = 'Resim seçilirken bir hata oluştu';
    } finally {
      setLoading(false);
    }
  }

  Future<void> upscaleImage() async {
    if (_selectedImage == null) return;

    try {
      setLoading(true);
      _error = null;

      // TODO: API entegrasyonu yapılacak
      // 1. Resmi API'ye gönder
      // 2. Yükseltilmiş resmi al
      // 3. Dosya olarak kaydet
      await Future.delayed(const Duration(seconds: 2));

      // Geçici olarak aynı resmi kullanıyoruz
      _resultImage = _selectedImage;
    } catch (e) {
      _error = 'Resim kalitesi yükseltilirken bir hata oluştu';
    } finally {
      setLoading(false);
    }
  }

  Future<void> downloadResult() async {
    if (_resultImage == null) return;

    try {
      setLoading(true);

      // TODO: İndirme işlemi implementasyonu yapılacak
      // 1. Galeriye kaydet
      // 2. Başarı mesajı göster
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      _error = 'Resim indirilirken bir hata oluştu';
    } finally {
      setLoading(false);
    }
  }

  void reset() {
    _selectedImage = null;
    _resultImage = null;
    _error = null;
    setLoading(false);
  }
}
