import '../../../core/base/base_view_model.dart';
import '../../../core/services/api_service.dart';
import '../../../core/services/cache_service.dart';
import '../model/image_options.dart';

class TextToImageViewModel extends BaseViewModel {
  final ApiService _apiService = ApiService();
  final CacheService _cacheService = CacheService();

  String _prompt = '';
  Styles? _selectedStyle;
  ImageSize _selectedSize = ImageSize.medium;
  ImageQuality _selectedQuality = ImageQuality.high;
  AIModel _selectedModel = AIModel.stableDiffusion;

  // Getters
  String get prompt => _prompt;
  Styles? get selectedStyle => _selectedStyle;
  ImageSize get selectedSize => _selectedSize;
  ImageQuality get selectedQuality => _selectedQuality;
  AIModel get selectedModel => _selectedModel;

  bool get canGenerate => _prompt.trim().length >= 10 && _selectedStyle != null && !isLoading;

  void setPrompt(String value) {
    _prompt = value;
    notifyListeners();
  }

  void selectStyle(Styles style) {
    _selectedStyle = style;
    notifyListeners();
  }

  void setSize(ImageSize size) {
    _selectedSize = size;
    notifyListeners();
  }

  void setQuality(ImageQuality quality) {
    _selectedQuality = quality;
    notifyListeners();
  }

  void setModel(AIModel model) {
    _selectedModel = model;
    notifyListeners();
  }

  Future<void> generateImage() async {
    await handleAsync(() async {
      try {
        final cachedImage = _cacheService.getCachedImage(_prompt);
        if (cachedImage != null) {
          return cachedImage;
        }

        final response = await _apiService.post(
          '/generate-image',
          body: {
            'prompt': _prompt,
            'style': _selectedStyle?.prompt,
            'size': '${_selectedSize.width}x${_selectedSize.height}',
            'steps': _selectedQuality.steps,
            'model': _selectedModel.title,
          },
        );

        await _cacheService.cacheImage(_prompt, response);
        return response;
      } catch (e) {
        throw Exception('Görsel oluşturulurken bir hata oluştu: $e');
      }
    });
  }

  void reset() {
    _prompt = '';
    _selectedStyle = null;
    _selectedSize = ImageSize.medium;
    _selectedQuality = ImageQuality.high;
    _selectedModel = AIModel.stableDiffusion;
    setError(null);
    notifyListeners();
  }
}
