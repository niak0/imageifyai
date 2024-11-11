import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? height;
  final double borderRadius;
  final double borderWidth;
  final double opacity;

  const GlassContainer({
    super.key,
    required this.child,
    this.color = Colors.transparent,
    this.height,
    this.borderRadius = 20,
    this.borderWidth = 0.9,
    this.opacity = 0.2,
  });

  Color _darkenToBlack(Color color) {
    return Color.alphaBlend(Colors.black.withOpacity(0.8), color.withOpacity(opacity));
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = color == Colors.transparent ? Colors.transparent : _darkenToBlack(color!);

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: color!.withOpacity(0.4),
          width: borderWidth,
        ),
        // Minimal glow efekti
        boxShadow: [
          BoxShadow(
            color: (color ?? Colors.transparent).withOpacity(0.1),
            blurRadius: 2,
            spreadRadius: 0,
          ),
        ],
      ),
      child: child,
    );
  }
}
