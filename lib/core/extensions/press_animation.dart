import 'package:flutter/material.dart';
import 'package:imageifyai/core/extensions/glow_extensions.dart';

/// Widget'lara basılma animasyonu ekleyen extension
extension PressAnimation on Widget {
  /// Widget'a basılma animasyonu ekler
  ///
  /// [onTap] - Basılma eventi
  /// [decoration] - Container dekorasyonu (opsiyonel)
  /// [height] - Container yüksekliği (opsiyonel)
  /// [width] - Container genişliği (opsiyonel)
  ///
  /// Basıldığında:
  /// - Widget %90 oranında küçülür
  /// - Glow efekti varsa artar
  ///
  /// Örnek kullanım:
  /// ```dart
  /// Container(
  ///   decoration: AppDecorations.baseContainer.withGlowEffect(),
  /// ).withPressAnimation(
  ///   onTap: () => print('Tapped!'),
  /// )
  /// ```
  Widget withPressAnimation({
    VoidCallback? onTap,
    BoxDecoration? decoration,
    double? height,
    double? width,
  }) {
    return _PressAnimationWidget(
      onTap: onTap,
      decoration: decoration,
      height: height,
      width: width,
      child: this,
    );
  }
}

class _PressAnimationWidget extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final BoxDecoration? decoration;
  final double? height;
  final double? width;

  const _PressAnimationWidget({
    required this.child,
    this.onTap,
    this.decoration,
    this.height,
    this.width,
  });

  @override
  State<_PressAnimationWidget> createState() => _PressAnimationWidgetState();
}

class _PressAnimationWidgetState extends State<_PressAnimationWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  BoxDecoration? get _pressedDecoration {
    if (widget.decoration == null) return null;
    return widget.decoration!.withGlowEffect(
      blurRadius: 16.0,
      spreadRadius: 3.0,
      glowColor: widget.decoration!.color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() {
        _isPressed = true;
        _controller.forward();
      }),
      onTapUp: (_) async {
        await Future.delayed(const Duration(milliseconds: 50));
        if (mounted) {
          setState(() {
            _isPressed = false;
            _controller.reverse();
          });
        }
      },
      onTapCancel: () => setState(() {
        _isPressed = false;
        _controller.reverse();
      }),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _isPressed ? 0.90 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: _isPressed ? _pressedDecoration : widget.decoration,
          child: widget.child,
        ),
      ),
    );
  }
}
