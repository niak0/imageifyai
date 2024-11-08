import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/color_constants.dart';
import 'package:imageifyai/features/avatars/view/avatars_view.dart';
import 'package:imageifyai/features/baby/view/baby_view.dart';
import 'package:imageifyai/features/filters/view/filters_view.dart';
import 'package:imageifyai/features/tattoo/view/tattoo_view.dart';
import 'package:imageifyai/features/text_to_image/view/text_to_image_view.dart';

class AIFeature {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final Widget page;

  const AIFeature._({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.page,
  });

  static const avatars = AIFeature._(
    title: 'Avatarlar',
    description: 'Kişiselleştirilmiş AI avatarları oluşturun',
    icon: Icons.face,
    color: AppColors.tertiary,
    page: AvatarsView(),
  );

  static const baby = AIFeature._(
    title: 'AI Bebek',
    description: 'Gelecekteki bebeğinizi görün',
    icon: Icons.child_care,
    color: AppColors.tertiary,
    page: BabyView(),
  );

  static const filters = AIFeature._(
    title: 'Filtreler',
    description: 'Fotoğraflarınıza sanatsal stiller uygulayın',
    icon: Icons.filter,
    color: AppColors.tertiary,
    page: FiltersView(),
  );

  static const tattoo = AIFeature._(
    title: 'Dövme',
    description: 'AI ile dövme tasarımları oluşturun',
    icon: Icons.brush,
    color: AppColors.tertiary,
    page: TattooView(),
  );

  static const textToImage = AIFeature._(
    title: 'Metin-Görüntü',
    description: 'Metinden AI görüntüleri oluşturun',
    icon: Icons.text_fields,
    color: AppColors.tertiary,
    page: TextToImageView(),
  );

  static final List<AIFeature> values = [
    avatars,
    baby,
    filters,
    tattoo,
    textToImage,
  ];
}
