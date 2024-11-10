import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:imageifyai/core/base/base_view_model.dart';

class RemoveBackgroundViewModel extends BaseViewModel {
  File? _selectedImage;
  File? _resultImage;
  String? _error;

  File? get selectedImage => _selectedImage;
  File? get resultImage => _resultImage;
  String? get error => _error;
  bool get hasResult => _resultImage != null;

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
      setError('Resim seçilirken bir hata oluştu');
    } finally {
      setLoading(false);
    }
  }

  Future<void> removeBackground() async {
    if (_selectedImage == null) return;

    try {
      setLoading(true);
      setError(null);

      // TODO: API entegrasyonu yapılacak
      // Örnek bekleme süresi
      await Future.delayed(const Duration(seconds: 2));

      // TODO: API'den dönen sonuç işlenecek
      _resultImage = _selectedImage; // Geçici olarak aynı resmi kullanıyoruz
    } catch (e) {
      _error = 'Arka plan kaldırılırken bir hata oluştu';
    } finally {
      setLoading(false);
    }
  }

  Future<void> downloadResult() async {
    if (_resultImage == null) return;

    try {
      setLoading(true);

      // TODO: İndirme işlemi implementasyonu yapılacak
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
