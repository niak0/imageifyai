import 'package:flutter/material.dart';
import 'package:imageifyai/features/home/models/ai_feature.dart';

class HomeViewModel extends ChangeNotifier {
  List<AIFeature> get creationFeatures => AIFeature.getFeaturesByCategory(FeatureCategory.creation);
  List<AIFeature> get utilityFeatures => AIFeature.getFeaturesByCategory(FeatureCategory.utility);

  // Feature'ların durumlarını yönetme (örn: aktif/pasif)
  void toggleFeatureStatus(AIFeature feature) {
    // ...
  }
}
