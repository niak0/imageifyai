import 'package:flutter/material.dart';

abstract class AppAnimations {
  // Süre sabitleri
  static const Duration fastest = Duration(milliseconds: 150);
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);

  // Curve sabitleri
  static const Curve defaultCurve = Curves.easeInOut;
  static const Curve bouncyCurve = Curves.elasticOut;
  static const Curve sharpCurve = Curves.easeOutExpo;
  static const Curve emphasizedCurve = Curves.easeInOutCubicEmphasized;

  // Scale değerleri
  static const double scaleNormal = 1.0;
  static const double scalePressed = 0.95;
  static const double scaleSelected = 1.05;

  // Opacity değerleri
  static const double opacityVisible = 1.0;
  static const double opacityHidden = 0.0;
  static const double opacityDim = 0.5;
  static const double opacityDisabled = 0.5;

  // Container animasyonları için
  static AnimatedContainer fadeContainer({
    required Widget child,
    required bool isVisible,
    Duration duration = normal,
    Curve curve = defaultCurve,
  }) {
    return AnimatedContainer(
      duration: duration,
      curve: curve,
      child: AnimatedOpacity(
        duration: duration,
        curve: curve,
        opacity: isVisible ? opacityVisible : opacityHidden,
        child: child,
      ),
    );
  }

  // Scale animasyonları için
  static AnimatedScale scaleAnimation({
    required Widget child,
    required bool isSelected,
    Duration duration = fast,
    Curve curve = defaultCurve,
  }) {
    return AnimatedScale(
      scale: isSelected ? scaleSelected : scaleNormal,
      duration: duration,
      curve: curve,
      child: child,
    );
  }

  // Opacity animasyonları için
  static AnimatedOpacity fadeAnimation({
    required Widget child,
    required bool isVisible,
    Duration duration = fast,
    Curve curve = defaultCurve,
  }) {
    return AnimatedOpacity(
      opacity: isVisible ? opacityVisible : opacityHidden,
      duration: duration,
      curve: curve,
      child: child,
    );
  }

  // Container decorations için
  static AnimatedContainer containerAnimation({
    required Widget child,
    required bool isSelected,
    required BuildContext context,
    Duration duration = normal,
    Curve curve = defaultCurve,
  }) {
    return AnimatedContainer(
      duration: duration,
      curve: curve,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.primary.withOpacity(0.1),
          width: 2,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ]
            : [],
      ),
      child: child,
    );
  }

  // Slide animasyonları için
  static SlideTransition slideAnimation({
    required Widget child,
    required Animation<double> animation,
    SlideDirection direction = SlideDirection.right,
  }) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: direction.offset,
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: defaultCurve,
      )),
      child: child,
    );
  }
}

// Slide yönleri için enum
enum SlideDirection {
  left(Offset(-1.0, 0.0)),
  right(Offset(1.0, 0.0)),
  up(Offset(0.0, -1.0)),
  down(Offset(0.0, 1.0));

  final Offset offset;
  const SlideDirection(this.offset);
}
