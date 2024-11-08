import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/color_constants.dart';
import 'package:imageifyai/features/avatars/view/avatars_view.dart';

class Feature {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final Widget page;

  Feature({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.page,
  });
}

final List<Feature> features = [
  Feature(
    title: 'Avatarlar',
    description: 'Kişiselleştirilmiş AI avatarları oluşturun',
    icon: Icons.face,
    color: AppColors.primary,
    page: const AvatarsView(),
  ),
  // ...
];
