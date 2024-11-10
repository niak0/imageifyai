import 'package:flutter/material.dart';
import 'package:imageifyai/core/services/navigation_service.dart';
import 'package:imageifyai/core/widgets/gradient_scaffold.dart';
import 'package:imageifyai/features/home/models/ai_feature.dart';
import 'package:imageifyai/features/home/view/widgets/custom_app_bar.dart';
import 'package:imageifyai/features/home/view/widgets/feature_card.dart';
import 'package:imageifyai/core/widgets/gradient_scaffold/grid_pattern.dart';
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
    return GradientScaffold(
      backgroundStyle: BackgroundStyle.simpleGrid,
      body: CustomScrollView(
        slivers: [
          const CustomAppBar(),
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
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingMedium),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
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
          ),

          // Yardımcı Araçlar
          _buildSectionHeader('Yardımcı Araçlar'),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingMedium,
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => FeatureCard(
                  feature: utilityFeatures[index],
                  onTap: () => NavigationService().navigateToPage(utilityFeatures[index].page),
                ),
                childCount: utilityFeatures.length,
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: AppConstants.paddingLarge,
            ),
            sliver: SliverToBoxAdapter(),
          ),
        ],
      ),
    );
  }

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
