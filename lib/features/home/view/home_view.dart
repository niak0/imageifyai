import 'package:flutter/material.dart';
import 'package:imageifyai/core/services/navigation_service.dart';
import 'package:imageifyai/features/home/models/ai_feature.dart';
import 'package:imageifyai/features/home/view/widgets/feature_card.dart';
import 'package:imageifyai/features/home/view/widgets/grid_pattern.dart';
import 'package:imageifyai/features/home/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/color_constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: const _HomeViewContent(),
    );
  }
}

class _HomeViewContent extends StatelessWidget {
  const _HomeViewContent();
  // Kategoriye göre özellikleri getiren getter'lar
  List<AIFeature> get creationFeatures => AIFeature.getFeaturesByCategory(FeatureCategory.creation);
  List<AIFeature> get utilityFeatures => AIFeature.getFeaturesByCategory(FeatureCategory.utility);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          _appBar,
          // Ana Özellik - Text to Image (Daha geniş ve dikkat çekici)
          SliverPadding(
            padding: const EdgeInsets.all(AppConstants.paddingMedium),
            sliver: SliverToBoxAdapter(
              child: FeatureCard(
                feature: AIFeature.textToImage,
                onTap: () => NavigationService().navigateToPage(AIFeature.textToImage.page),
              ),
            ),
          ),

          // AI Üretim Araçları
          _buildSectionHeader('AI Üretim Araçları'),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.1,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => FeatureCard(
                feature: creationFeatures[index],
                onTap: () => NavigationService().navigateToPage(creationFeatures[index].page),
              ),
              childCount: creationFeatures.length,
            ),
          ),

          // Yardımcı Araçlar
          _buildSectionHeader('Yardımcı Araçlar'),
          SliverToBoxAdapter(
            child: Column(
              children: utilityFeatures
                  .map((feature) => FeatureCard(
                        feature: feature,
                        onTap: () => NavigationService().navigateToPage(feature.page),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar get _appBar => SliverAppBar(
        expandedHeight: 150,
        floating: false,
        pinned: true,
        backgroundColor: AppColors.background,
        flexibleSpace: FlexibleSpaceBar(
          title: const Text(
            'AI Studio',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          background: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: AppColors.primaryGradient,
              ),
            ),
            child: const Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.1,
                    child: GridPattern(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildSectionHeader(String title) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingMedium,
        vertical: AppConstants.paddingSmall,
      ),
      sliver: SliverToBoxAdapter(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
