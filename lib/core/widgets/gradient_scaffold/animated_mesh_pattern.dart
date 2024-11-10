import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedMeshPattern extends StatefulWidget {
  final Color primaryColor;
  final Color secondaryColor;

  const AnimatedMeshPattern({
    super.key,
    this.primaryColor = const Color(0xFF8687E7),
    this.secondaryColor = const Color(0xFF6C72CB),
  });

  @override
  State<AnimatedMeshPattern> createState() => _AnimatedMeshPatternState();
}

class _AnimatedMeshPatternState extends State<AnimatedMeshPattern> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: MeshPainter(
            animation: _controller,
            primaryColor: widget.primaryColor,
            secondaryColor: widget.secondaryColor,
          ),
          child: const SizedBox.expand(),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class MeshPainter extends CustomPainter {
  final Animation<double> animation;
  final Color primaryColor;
  final Color secondaryColor;

  MeshPainter({
    required this.animation,
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const spacing = 30.0;
    final points = <Offset>[];

    for (var x = 0.0; x < size.width; x += spacing) {
      for (var y = 0.0; y < size.height; y += spacing) {
        final dx = x + sin((animation.value * 2 * pi) + (y / 30)) * 5;
        final dy = y + cos((animation.value * 2 * pi) + (x / 30)) * 5;
        points.add(Offset(dx, dy));
      }
    }

    for (var point in points) {
      paint.color = primaryColor.withOpacity(0.1);
      canvas.drawCircle(point, 2, paint);

      for (var otherPoint in points) {
        final distance = (point - otherPoint).distance;
        if (distance < 60) {
          paint.color = secondaryColor.withOpacity(0.05 * (1 - distance / 60));
          canvas.drawLine(point, otherPoint, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(MeshPainter oldDelegate) => true;
}
