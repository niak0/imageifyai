import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/color_constants.dart';
import 'package:imageifyai/features/avatars/view/avatars_view.dart';
import 'package:imageifyai/features/baby/view/baby_view.dart';
import 'package:imageifyai/features/filters/view/filters_view.dart';
import 'package:imageifyai/features/tattoo/view/tattoo_view.dart';
import 'package:imageifyai/features/text_to_image/view/text_to_image_view.dart';
import 'package:imageifyai/features/upscaler/view/upscaler_view.dart';

import '../../rem_bg/view/rem_bg_view.dart';

enum FeatureCategory {
  creation, // AI Üretim Araçları
  utility, // Yardımcı Araçlar
  main // Ana Özellik (Text to Image)
}

class AIFeature {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final Widget page;
  final FeatureCategory category;

  const AIFeature._({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.page,
    required this.category,
  });

  static const textToImage = AIFeature._(
    title: 'Metin-Görüntü',
    description: 'Metinden AI görüntüleri oluşturun',
    icon: Icons.text_fields,
    color: AppColors.primary,
    page: TextToImageView(),
    category: FeatureCategory.main,
  );

  // AI Üretim Araçları
  static const avatars = AIFeature._(
    title: 'Avatarlar',
    description: 'Kişiselleştirilmiş AI avatarları oluşturun',
    icon: Icons.face,
    color: AppColors.tools,
    page: AvatarsView(),
    category: FeatureCategory.creation,
  );

  static const baby = AIFeature._(
    title: 'AI Bebek',
    description: 'Gelecekteki bebeğinizi görün',
    icon: Icons.child_care,
    color: AppColors.tools,
    page: BabyView(),
    category: FeatureCategory.creation,
  );

  static const filters = AIFeature._(
    title: 'Filtreler',
    description: 'Fotoğraflarınıza sanatsal stiller uygulayın',
    icon: Icons.filter,
    color: AppColors.tools,
    page: FiltersView(),
    category: FeatureCategory.creation,
  );

  static const tattoo = AIFeature._(
    title: 'Dövme',
    description: 'AI ile dövme tasarımları oluşturun',
    icon: Icons.brush,
    color: AppColors.tools,
    page: TattooView(),
    category: FeatureCategory.creation,
  );

  // Yardımcı Araçlar
  static const removeBackground = AIFeature._(
    title: 'Arka Planı Kaldır',
    description: 'Fotoğraflarınızın arka planını kaldırın',
    icon: Icons.remove_red_eye,
    color: AppColors.utility,
    page: RemoveBackgroundView(),
    category: FeatureCategory.utility,
  );

  static const upscaler = AIFeature._(
    title: 'Yüksek Çözünürlük',
    description: 'Fotoğraflarınızın çözünürlüğünü artırın',
    icon: Icons.zoom_in,
    color: AppColors.utility,
    page: UpscalerView(),
    category: FeatureCategory.utility,
  );

  // Kategoriye göre özellikleri getiren yardımcı metodlar
  static List<AIFeature> getFeaturesByCategory(FeatureCategory category) {
    return values.where((feature) => feature.category == category).toList();
  }

  static final List<AIFeature> values = [
    textToImage,
    avatars,
    baby,
    filters,
    tattoo,
    removeBackground,
    upscaler,
  ];
}
