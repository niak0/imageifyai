import 'package:flutter/material.dart';
import 'package:imageifyai/product/styles/decorations.dart';
import 'package:imageifyai/product/tokens/colors.dart';
import 'package:imageifyai/core/extensions/glow_extensions.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      expandedHeight: 180,
      floating: false,
      pinned: true,
      backgroundColor: AppColors.background,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: const Icon(
            Icons.menu,
            color: AppColors.primary,
          ).withEffect(),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      flexibleSpace: SafeArea(
        child: FlexibleSpaceBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Imageify AI',
                style: theme.textTheme.headlineMedium,
              ).withEffect(),
              const SizedBox(width: 8),
              Container(
                decoration: AppDecorations.baseContainer,
                width: 35,
                height: 20,
                child: Center(
                  child: Text(
                    'Beta',
                    style: theme.textTheme.bodySmall,
                  ).withEffect(color: AppColors.text),
                ),
              ),
            ],
          ),
          background: Stack(
            children: [
              // Dekoratif elementler
              Positioned(
                right: 20,
                bottom: 60,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        const Color(0xFF00F5FF).withOpacity(0.2),
                        const Color(0xFFFF00FF).withOpacity(0.1),
                      ],
                    ),
                    border: Border.all(
                      color: const Color(0xFF00F5FF).withOpacity(0.3),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF00F5FF).withOpacity(0.2),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
              ),

              // AI ikonları
              Positioned(
                right: 30,
                top: 40,
                child: Row(
                  children: [
                    Icon(
                      Icons.auto_awesome,
                      color: const Color(0xFF00F5FF).withOpacity(0.7),
                      size: 20,
                      shadows: const [
                        Shadow(
                          color: Color(0xFF00F5FF),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    const SizedBox(width: 12),
                    Icon(
                      Icons.psychology,
                      color: const Color(0xFFFF00FF).withOpacity(0.7),
                      size: 20,
                      shadows: const [
                        Shadow(
                          color: Color(0xFFFF00FF),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      shadowColor: const Color(0xFF00F5FF).withOpacity(0.2),
      forceElevated: true,
    );
  }
}
