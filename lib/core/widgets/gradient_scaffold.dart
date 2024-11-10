import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/color_constants.dart';
import 'package:imageifyai/core/widgets/gradient_scaffold/particle_system.dart';
import 'package:imageifyai/core/widgets/gradient_scaffold/modern_grid_pattern.dart';
import 'package:imageifyai/core/widgets/gradient_scaffold/grid_pattern.dart';

enum BackgroundStyle {
  none, // Arka plan yok
  simpleGrid, // Basit, statik grid
  modernGrid, // Animasyonlu modern grid
  particles // Animasyonlu parçacık sistemi
}

class GradientScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool resizeToAvoidBottomInset;

  // Drawer özellikleri
  final Widget? drawer;
  final Widget? endDrawer;
  final Color? drawerScrimColor;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;

  // Arka plan özellikleri
  final BackgroundStyle backgroundStyle;
  final Color? backgroundColor;
  final Color primaryColor;
  final Color secondaryColor;
  final double backgroundOpacity;
  final double gradientOpacity;
  final List<Color>? gradientColors; // Gradient renkleri için yeni parametre

  const GradientScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.resizeToAvoidBottomInset = true,
    // Drawer parametreleri
    this.drawer,
    this.endDrawer,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    // Arka plan parametreleri
    this.backgroundStyle = BackgroundStyle.none,
    this.backgroundColor,
    this.primaryColor = const Color(0xFF8687E7),
    this.secondaryColor = const Color(0xFF6C72CB),
    this.backgroundOpacity = 1.0,
    this.gradientOpacity = 0.05,
    this.gradientColors, // Yeni parametre
  });

  Widget _buildBackground() {
    switch (backgroundStyle) {
      case BackgroundStyle.simpleGrid:
        return const GridPattern();

      case BackgroundStyle.modernGrid:
        return ModernGridPattern(
          primaryColor: primaryColor,
          accentColor: secondaryColor,
        );

      case BackgroundStyle.particles:
        return const ParticleSystem(
          particleColor: AppColors.neonGreen,
          particleCount: 100,
        );

      case BackgroundStyle.none:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor = backgroundColor ?? Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      backgroundColor: effectiveBackgroundColor.withOpacity(backgroundOpacity),
      appBar: appBar,
      drawer: drawer,
      endDrawer: endDrawer,
      drawerScrimColor: drawerScrimColor,
      drawerEdgeDragWidth: drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
      endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: gradientColors ??
                    [
                      effectiveBackgroundColor,
                      primaryColor.withOpacity(gradientOpacity),
                    ],
              ),
            ),
          ),
          _buildBackground(),
          body,
        ],
      ),
    );
  }
}
