import 'package:flutter/material.dart';
import 'package:imageifyai/core/services/navigation_service.dart';
import 'package:imageifyai/core/themes/cyberpunk/extensions/cyberpunk_text_extension.dart';
import 'package:imageifyai/core/themes/cyberpunk/widgets/cyberpunk_card.dart';
import 'package:imageifyai/core/widgets/gradient_scaffold.dart';
import 'package:imageifyai/features/home/models/ai_feature.dart';
import 'package:imageifyai/features/home/view/widgets/app_drawer.dart';
import 'package:imageifyai/features/home/view/widgets/custom_app_bar.dart';
import 'package:imageifyai/features/home/view/widgets/feature_card.dart';
import 'package:imageifyai/features/home/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/themes/cyberpunk/cyberpunk_theme.dart';

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
    // Cyberpunk temasını aktif et
    CyberpunkTheme.enabled = true;
    CyberpunkTheme.defaultStyle = CyberpunkStyle.glass;

    return GradientScaffold(
      drawer: const AppDrawer(),
      drawerScrimColor: Colors.black54, // İsteğe bağlı: Drawer açıkken arka plan rengi
      backgroundStyle: BackgroundStyle.modernGrid,
      body: CustomScrollView(
        slivers: [
          const CustomAppBar(),
          // Ana Özellik - Text to Image
          SliverPadding(
            padding: const EdgeInsets.all(AppConstants.paddingMedium),
            sliver: SliverToBoxAdapter(
              child: CyberpunkCard(
                style: CyberpunkStyle.glass,
                color: AppColors.primary,
                child: FeatureCard(
                  feature: AIFeature.textToImage,
                  onTap: () => NavigationService().navigateToPage(AIFeature.textToImage.page),
                ),
              ),
            ),
          ),

          // AI Üretim Araçları Başlığı
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingMedium,
              vertical: AppConstants.paddingSmall,
            ),
            sliver: SliverToBoxAdapter(
              child: Text(
                'AI Üretim Araçları',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ).withNeonEffect(color: AppColors.secondary),
            ),
          ),

          // AI Üretim Araçları Grid
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
                (context, index) => CyberpunkCard(
                  style: CyberpunkStyle.neon,
                  color: creationFeatures[index].color,
                  child: FeatureCard(
                    feature: creationFeatures[index],
                    onTap: () => NavigationService().navigateToPage(creationFeatures[index].page),
                  ),
                ),
                childCount: creationFeatures.length,
              ),
            ),
          ),

          // Yardımcı Araçlar Başlığı
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingMedium,
              vertical: AppConstants.paddingSmall,
            ),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Yardımcı Araçlar',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ).withNeonEffect(color: AppColors.tertiary),
            ),
          ),

          // Yardımcı Araçlar Listesi
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingMedium,
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: CyberpunkCard(
                    style: CyberpunkStyle.gradient,
                    color: utilityFeatures[index].color,
                    child: FeatureCard(
                      feature: utilityFeatures[index],
                      onTap: () => NavigationService().navigateToPage(utilityFeatures[index].page),
                    ),
                  ),
                ),
                childCount: utilityFeatures.length,
              ),
            ),
          ),

          const SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: AppConstants.paddingLarge,
            ),
          ),
        ],
      ),
    );
  }
}
