import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/color_constants.dart';
import 'package:imageifyai/core/theme/cyberpunk/cyberpunk_theme.dart';
import 'package:imageifyai/core/theme/cyberpunk/extensions/cyberpunk_icon_extension.dart';
import 'package:imageifyai/core/theme/cyberpunk/widgets/cyberpunk_card.dart';
import 'package:imageifyai/core/widgets/gradient_scaffold/modern_grid_pattern.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 180,
      floating: false,
      pinned: true,
      backgroundColor: AppColors.background.withOpacity(0.9),
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CyberpunkCard(
          style: CyberpunkStyle.glass,
          child: IconButton(
            icon: Icon(
              Icons.menu,
              color: AppColors.primary,
            ).withNeonEffect(),
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
              'AI Studio',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                shadows: [
                  Shadow(
                    color: Color(0xFF00F5FF),
                    blurRadius: 8,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF00F5FF).withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF00F5FF).withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: const Text(
                'Beta',
                style: TextStyle(
                  color: Color(0xFF00F5FF),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  shadows: [
                    Shadow(
                      color: Color(0xFF00F5FF),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        background: Stack(
          children: [
            // Statik elementler
            const DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xFF0A0A0F),
              ),
            ),

            // Gradient (statik)
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF00F5FF).withOpacity(0.1),
                    const Color(0xFFFF00FF).withOpacity(0.1),
                  ],
                  stops: const [0.2, 1.0],
                ),
              ),
            ),

            // Grid pattern (optimize edilmiş)
            const Positioned.fill(
              child: ModernGridPattern(
                primaryColor: Color(0xFF00F5FF),
                accentColor: Color(0xFFFF00FF),
              ),
            ),

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
