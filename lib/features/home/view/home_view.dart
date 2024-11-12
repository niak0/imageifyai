import 'package:flutter/material.dart';
import 'package:imageifyai/core/services/navigation_service.dart';
import 'package:imageifyai/core/widgets/glass_container.dart';
import 'package:imageifyai/core/widgets/gradient_scaffold.dart';
import 'package:imageifyai/features/home/models/ai_feature.dart';
import 'package:imageifyai/features/home/view/widgets/app_drawer.dart';
import 'package:imageifyai/features/home/view/widgets/custom_app_bar.dart';
import 'package:imageifyai/features/home/view/widgets/feature_card.dart';
import 'package:imageifyai/features/home/viewmodel/home_view_model.dart';
import 'package:imageifyai/product/tokens/app_tokens.dart';
import 'package:provider/provider.dart';
import '../../../product/tokens/colors.dart';

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
    return GradientScaffold(
      drawer: const AppDrawer(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const CustomAppBar(),
          // Ana Özellik - Text to Image
          SliverPadding(
            padding: AppTokens.paddingAllMd,
            sliver: SliverToBoxAdapter(
              child: BaseContainer(
                onTap: () => NavigationService().navigateToPage(AIFeature.textToImage.page),
                child: const FeatureCard(
                  feature: AIFeature.textToImage,
                ),
              ),
            ),
          ),

          // AI Üretim Araçları Başlığı
          const SliverPadding(
            padding: AppTokens.paddingAllMd,
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
            padding: AppTokens.paddingAllMd,
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.1,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => BaseContainer(
                  onTap: () => NavigationService().navigateToPage(creationFeatures[index].page),
                  child: FeatureCard(
                    feature: creationFeatures[index],
                  ),
                ),
                childCount: creationFeatures.length,
              ),
            ),
          ),

          // Yardımcı Araçlar Başlığı
          const SliverPadding(
            padding: AppTokens.paddingAllMd,
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
            padding: AppTokens.paddingAllMd,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: BaseContainer(
                    color: AppColors.secondary,
                    isTransparent: true,
                    onTap: () => NavigationService().navigateToPage(utilityFeatures[index].page),
                    child: FeatureCard(
                      feature: utilityFeatures[index],
                      useListTile: true,
                    ),
                  ),
                ),
                childCount: utilityFeatures.length,
              ),
            ),
          ),

          const SliverPadding(
            padding: AppTokens.paddingAllMd,
          ),
        ],
      ),
    );
  }
}
