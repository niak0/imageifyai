import 'package:flutter/material.dart';
import 'package:imageifyai/features/tattoo/model/tattoo_example.dart';
import '../model/tattoo_style.dart';

class TattooViewModel extends ChangeNotifier {
  // Controllers
  final TextEditingController promptController = TextEditingController();

  // State variables
  TattooStyle _selectedStyle = TattooStyle.oldSchool;
  bool _isLoading = false;
  String? _error;

  // Getters
  TattooStyle get selectedStyle => _selectedStyle;
  bool get isLoading => _isLoading;
  String? get error => _error;
  // Örnek dövmeler ve ilgili promptları
  final List<TattooExample> examples = [
    TattooExample(
      imageUrl: 'https://picsum.photos/id/237/200/300',
      prompt: 'Minimal tarzda geometrik kurt dövmesi',
    ),
    TattooExample(
      imageUrl: 'https://picsum.photos/id/238/200/300',
      prompt: 'Japon tarzı ejderha ve kiraz çiçekleri',
    ),
    TattooExample(
      imageUrl: 'https://picsum.photos/id/239/200/300',
      prompt: 'Deniz dalgaları içinde yüzen balina',
    ),
    TattooExample(
      imageUrl: 'https://picsum.photos/id/240/200/300',
      prompt: 'Tribal tarzda aslan portresi',
    ),
  ];
  // Örnek dövme görselleri
  final List<String> exampleImages = [
    'https://picsum.photos/id/237/200/300',
    'https://picsum.photos/id/238/200/300',
    'https://picsum.photos/id/239/200/300',
    'https://picsum.photos/id/240/200/300',
  ];

  // Örnek dövme açıklamaları
  final List<String> surprisePrompts = [
    'Renkli alevler içinde parlayan bir kurukafa',
    'Güller ve yıldızlarla süslenmiş mistik bir unicorn',
    'Tribal tarzda ejderha dövmesi',
    'Minimalist geometrik desen',
    'Japon tarzı dalga ve kiraz çiçekleri',
    'Kelt düğümleri ile süslenmiş kurt',
    'Steampunk tarzı mekanik kalp',
    'Watercolor tekniğinde kozmik galaksi',
  ];

  // Methods
  void selectStyle(TattooStyle style) {
    _selectedStyle = style;
    notifyListeners();
  }

  Future<void> generateTattoo(String prompt) async {
    if (prompt.isEmpty) return;

    try {
      _setLoading(true);
      _error = null;

      // TODO: API çağrısı yapılacak
      await Future.delayed(const Duration(seconds: 2)); // Simülasyon için

      // TODO: Sonucu işle
    } catch (e) {
      _error = 'Dövme oluşturulurken bir hata oluştu';
    } finally {
      _setLoading(false);
    }
  }

  void generateSurprisePrompt() {
    final random = surprisePrompts[DateTime.now().millisecond % surprisePrompts.length];
    promptController.text = random;
    notifyListeners();
  }

  void selectExample(int index) {
    // TODO: Seçilen örneği kullanarak yeni dövme oluştur
    generateTattoo('Seçilen örneğe benzer bir dövme: ${exampleImages[index]}');
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  @override
  void dispose() {
    promptController.dispose();
    super.dispose();
  }
}
