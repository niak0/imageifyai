import 'package:flutter/material.dart';
import 'package:imageifyai/features/home/models/ai_feature.dart';

class HomeViewModel extends ChangeNotifier {
  AIFeature _selectedFeature = AIFeature.textToImage;

  AIFeature get selectedFeature => _selectedFeature;

  void setFeature(AIFeature feature) {
    if (feature == _selectedFeature) return;
    _selectedFeature = feature;
    notifyListeners();
  }
}
