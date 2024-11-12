import 'package:flutter/material.dart';
import 'package:imageifyai/product/tokens/colors.dart';

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
    this.backgroundColor,
    this.primaryColor = AppColors.primaryBackground,
    this.secondaryColor = const Color(0xFF041326),
    this.backgroundOpacity = 0.9,
    this.gradientOpacity = 0.05,
    this.gradientColors, // Yeni parametre
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor = backgroundColor ?? AppColors.primaryBackground;

    return Scaffold(
      backgroundColor: effectiveBackgroundColor,
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
        fit: StackFit.expand,
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
                      secondaryColor.withOpacity(gradientOpacity),
                    ],
              ),
            ),
          ),
          body,
        ],
      ),
    );
  }
}
