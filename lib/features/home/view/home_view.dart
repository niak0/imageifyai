import 'package:flutter/material.dart';
import 'package:imageifyai/core/services/navigation_service.dart';
import 'package:imageifyai/features/home/models/ai_feature.dart';
import 'package:imageifyai/features/home/viewmodel/home_view_model.dart';
import 'package:imageifyai/features/home/view/widgets/feature_card.dart';
import 'package:imageifyai/features/home/view/widgets/grid_pattern.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // Özel App Bar
          SliverAppBar(
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
                    // Arka plan deseni
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
          ),

          // İçerik
          SliverPadding(
            padding: const EdgeInsets.all(AppConstants.paddingMedium),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.85,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => FeatureCard(
                  key: ValueKey(AIFeature.values[index].title),
                  feature: AIFeature.values[index],
                  onTap: () => NavigationService().navigateToPage(AIFeature.values[index].page),
                ),
                childCount: AIFeature.values.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
