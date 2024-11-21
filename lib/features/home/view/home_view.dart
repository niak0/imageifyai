import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/app_constants.dart';
import 'package:imageifyai/core/extensions/glow_extensions.dart';
import 'package:imageifyai/core/extensions/press_animation.dart';
import 'package:imageifyai/core/services/navigation_service.dart';
import 'package:imageifyai/features/home/models/ai_feature.dart';
import 'package:imageifyai/features/home/view/widgets/app_drawer.dart';
import 'package:imageifyai/features/home/view/widgets/custom_app_bar.dart';
import 'package:imageifyai/features/home/view/widgets/feature_card.dart';
import 'package:imageifyai/features/home/viewmodel/home_view_model.dart';
import 'package:imageifyai/core/styles/decorations.dart';
import 'package:imageifyai/core/constants/colors.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: HomeViewModel(),
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
      drawer: const AppDrawer(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const CustomAppBar(),
          // Ana Özellik - Text to Image
          SliverPadding(
            padding: AppConstants.paddingAllMd,
            sliver: SliverToBoxAdapter(
              child: Container(
                decoration: AppDecorations.baseContainer.withGlowEffect(),
                child: const FeatureCard(
                  feature: AIFeature.textToImage,
                ),
              ).withPressAnimation(
                onTap: () => NavigationService().navigateToPage(AIFeature.textToImage.page),
              ),
            ),
          ),

          // AI Üretim Araçları Başlığı
          const SliverPadding(
            padding: AppConstants.paddingAllMd,
            sliver: SliverToBoxAdapter(
              child: Text(
                'AI Üretim Araçları',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // AI Üretim Araçları Grid
          SliverPadding(
            padding: AppConstants.paddingAllMd,
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.1,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  decoration: AppDecorations.baseContainer.withGlowEffect(),
                  child: FeatureCard(
                    feature: creationFeatures[index],
                  ),
                ).withPressAnimation(
                  onTap: () => NavigationService().navigateToPage(creationFeatures[index].page),
                ),
                childCount: creationFeatures.length,
              ),
            ),
          ),

          // Yardımcı Araçlar Başlığı
          const SliverPadding(
            padding: AppConstants.paddingAllMd,
            sliver: SliverToBoxAdapter(
              child: Text(
                'Yardımcı Araçlar',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Yardımcı Araçlar Listesi
          SliverPadding(
            padding: AppConstants.paddingAllMd,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Container(
                    decoration: AppDecorations.baseContainer.withGlowEffect(
                      glowColor: AppColors.secondary,
                    ),
                    child: FeatureCard(
                      feature: utilityFeatures[index],
                      useListTile: true,
                    ),
                  ).withPressAnimation(
                    onTap: () => NavigationService().navigateToPage(utilityFeatures[index].page),
                  ),
                ),
                childCount: utilityFeatures.length,
              ),
            ),
          ),

          const SliverPadding(
            padding: AppConstants.paddingAllMd,
          ),
        ],
      ),
    );
  }
}
