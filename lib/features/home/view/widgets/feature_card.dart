import 'package:flutter/material.dart';
import 'package:imageifyai/core/tokens/colors.dart';
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
    return useListTile ? _buildListTile() : _buildCard();
  }

  Widget _buildListTile() {
    return ListTile(
      dense: true,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.tertiary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          feature.icon,
          color: AppColors.tertiary,
        ),
      ),
      title: Text(
        feature.title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.tertiary.withOpacity(0.8),
        ),
      ),
      subtitle: Text(
        feature.description,
        style: const TextStyle(
          fontSize: 14,
          color: AppColors.text,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: AppColors.text,
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
            color: AppColors.primary,
          ),
          const SizedBox(height: 5),
          // Başlık
          Text(
            feature.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 5),
          // Açıklama
          Text(
            feature.description,
            style: const TextStyle(
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
