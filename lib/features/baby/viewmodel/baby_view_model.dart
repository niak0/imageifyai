import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/services/image_service.dart';

class BabyViewModel extends ChangeNotifier {
  final ImageService _imageService = ImageService();

  String? parent1Image;
  String? parent2Image;
  Gender? selectedGender;
  bool isLoading = false;

  bool get canGenerate => parent1Image != null && parent2Image != null && selectedGender != null;

  Future<void> selectParent1Image(ImageSource source) async {
    try {
      isLoading = true;
      notifyListeners();

      final imagePath = await _imageService.pickImage(source);
      if (imagePath != null) {
        parent1Image = imagePath;
      }
    } catch (e) {
      debugPrint('Fotoğraf seçme hatası: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> selectParent2Image(ImageSource source) async {
    try {
      isLoading = true;
      notifyListeners();

      final imagePath = await _imageService.pickImage(source);
      if (imagePath != null) {
        parent2Image = imagePath;
      }
    } catch (e) {
      debugPrint('Fotoğraf seçme hatası: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void selectGender(Gender gender) {
    selectedGender = gender;
    notifyListeners();
  }

  void resetImages() {
    parent1Image = null;
    parent2Image = null;
    notifyListeners();
  }
}

enum Gender { male, female, surprise }
