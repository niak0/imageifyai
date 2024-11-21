import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:imageifyai/core/base/base_view_model.dart';
import '../../../../core/services/image_service.dart';

class UpscalerViewModel extends BaseViewModel {
  final ImageService _imageService = ImageService();

  File? _selectedImage;
  File? _resultImage;
  String? _error;

  File? get selectedImage => _selectedImage;
  File? get resultImage => _resultImage;
  String? get error => _error;
  bool get hasResult => _resultImage != null;

  Future<void> pickImage(ImageSource source) async {
    await handleAsync(() async {
      final imagePath = await _imageService.pickImage(source);
      if (imagePath != null) {
        _selectedImage = File(imagePath);
        _resultImage = null;
        _error = null;
      }
    });
  }

  Future<void> upscaleImage() async {
    if (_selectedImage == null) return;

    await handleAsync(() async {
      // TODO: API entegrasyonu yapılacak
      await Future.delayed(const Duration(seconds: 2));

      // TODO: API'den dönen sonuç işlenecek
      _resultImage = _selectedImage; // Geçici olarak aynı resmi kullanıyoruz
    });
  }

  Future<void> downloadResult() async {
    if (_resultImage == null) return;

    await handleAsync(() async {
      // TODO: İndirme işlemi implementasyonu yapılacak
      await Future.delayed(const Duration(seconds: 1));
    });
  }

  void reset() {
    _selectedImage = null;
    _resultImage = null;
    _error = null;
    setLoading(false);
  }
}
