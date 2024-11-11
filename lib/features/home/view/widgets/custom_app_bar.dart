import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/color_constants.dart';
import 'package:imageifyai/core/theme/extensions/theme_extensions.dart';

import '../../../../core/theme/widgets/glass_container.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 180,
      floating: false,
      pinned: true,
      backgroundColor: AppColors.primaryBackground,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BaseContainer(
          color: AppColors.primary,
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
      ),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Imageify AI',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ).withEffect(color: AppColors.text.withOpacity(0.9)),
            const SizedBox(width: 8),
            const BaseContainer(
              width: 40,
              height: 25,
              color: AppColors.primary,
              child: Center(
                child: Text(
                  'Beta',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
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
      shadowColor: const Color(0xFF00F5FF).withOpacity(0.2),
      forceElevated: true,
    );
  }
}
