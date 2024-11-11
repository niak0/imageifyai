import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/color_constants.dart';
import 'package:imageifyai/core/theme/widgets/glass_container.dart';
import 'package:imageifyai/features/home/models/ai_feature.dart';

class FeatureCard extends StatelessWidget {
  final AIFeature feature;
  final VoidCallback? onTap;
  final bool useListTile;

  const FeatureCard({
    super.key,
    required this.feature,
    this.onTap,
    this.useListTile = false,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      onTap: () {
        onTap?.call();
      },
      color: feature.color,
      child: useListTile ? _buildListTile() : _buildCard(),
    );
  }

  Widget _buildListTile() {
    return ListTile(
      dense: true,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: feature.color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          feature.icon,
          color: feature.color,
        ),
      ),
      title: Text(
        feature.title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        feature.description,
        style: TextStyle(
          fontSize: 14,
          color: AppColors.textLow,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: feature.color,
      ),
      onTap: onTap,
    );
  }

  Padding _buildCard() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // İkon
          Icon(
            feature.icon,
            size: 32,
            color: feature.color,
          ),
          const SizedBox(height: 5),
          // Başlık
          Text(
            feature.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          // Açıklama
          Text(
            feature.description,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textLow,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
