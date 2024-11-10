import 'package:flutter/material.dart';
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

  // Arka plan özellikleri
  final BackgroundStyle backgroundStyle;
  final Color? backgroundColor;
  final Color primaryColor;
  final Color secondaryColor;
  final double backgroundOpacity;
  final double gradientOpacity;

  const GradientScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.resizeToAvoidBottomInset = true,
    this.backgroundStyle = BackgroundStyle.none,
    this.primaryColor = const Color(0xFF8687E7),
    this.secondaryColor = const Color(0xFF6C72CB),
    this.backgroundColor,
    this.backgroundOpacity = 1.0,
    this.gradientOpacity = 0.05,
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
        return ParticleSystem(
          particleColor: primaryColor,
          particleCount: 50,
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
                colors: [
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
