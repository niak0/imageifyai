import 'package:flutter/material.dart';
import 'package:imageifyai/product/tokens/animations.dart';

class FadeRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  /// FadeRoute oluşturur
  /// [page] sayfa widget'ı
  FadeRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: AppAnimations.slow,
        );
}
