import 'package:flutter/material.dart';
import 'dart:math' as math;

class ModernGridPattern extends StatefulWidget {
  final Color primaryColor;
  final Color accentColor;

  const ModernGridPattern({
    super.key,
    this.primaryColor = const Color(0xFF8687E7),
    this.accentColor = const Color(0xFF6C72CB),
  });

  @override
  State<ModernGridPattern> createState() => _ModernGridPatternState();
}

class _ModernGridPatternState extends State<ModernGridPattern> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        isComplex: true,
        willChange: false,
        painter: ModernGridPainter(
          animation: _controller,
          primaryColor: widget.primaryColor,
          accentColor: widget.accentColor,
        ),
        child: const SizedBox.expand(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ModernGridPainter extends CustomPainter {
  final Animation<double> animation;
  final Color primaryColor;
  final Color accentColor;

  ModernGridPainter({
    required this.animation,
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

    // Grid noktaları için parametreler
    const spacing = 30.0;
    const baseRadius = 1.0;
    final rows = (size.height / spacing).ceil();
    final cols = (size.width / spacing).ceil();

    // Büyük daireler için parametreler
    final bigCircleRadius1 = size.width * 0.3;
    final bigCircleRadius2 = size.width * 0.2;

    // Büyük daireleri çiz
    paint.color = accentColor.withOpacity(0.03);

    // Sol üst daire
    final circle1Center = Offset(
      size.width * 0.2,
      size.height * 0.3 + (animation.value * 20),
    );
    canvas.drawCircle(circle1Center, bigCircleRadius1, paint);

    // Sağ alt daire
    final circle2Center = Offset(
      size.width * 0.8,
      size.height * 0.7 - (animation.value * 20),
    );
    canvas.drawCircle(circle2Center, bigCircleRadius2, paint);

    // Grid noktalarını çiz
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        final x = j * spacing;
        final y = i * spacing;

        // Animasyon değerine bağlı olarak nokta pozisyonunu hafifçe kaydır
        final offsetX = math.sin((animation.value * 2 * math.pi) + (y / 30)) * 3;
        final offsetY = math.cos((animation.value * 2 * math.pi) + (x / 30)) * 3;

        final center = Offset(x + offsetX, y + offsetY);

        // Büyük dairelere yakınlığa göre nokta boyutunu ayarla
        final distanceToCircle1 = (center - circle1Center).distance;
        final distanceToCircle2 = (center - circle2Center).distance;

        final circleEffect1 = (1 - (distanceToCircle1 / bigCircleRadius1)).clamp(0.0, 1.0);
        final circleEffect2 = (1 - (distanceToCircle2 / bigCircleRadius2)).clamp(0.0, 1.0);

        final radius = baseRadius + math.max(circleEffect1, circleEffect2) * 2;

        // Noktayı çiz
        paint.color = primaryColor.withOpacity(0.15);
        canvas.drawCircle(center, radius, paint);

        // Yakın noktalara bağlantı çizgileri çiz
        if (i > 0 && j > 0) {
          paint.color = primaryColor.withOpacity(0.05);

          // Yatay çizgi
          if (j < cols - 1) {
            canvas.drawLine(
              center,
              Offset(x + spacing + offsetX, y + offsetY),
              paint,
            );
          }

          // Dikey çizgi
          if (i < rows - 1) {
            canvas.drawLine(
              center,
              Offset(x + offsetX, y + spacing + offsetY),
              paint,
            );
          }
        }
      }
    }
  }

  @override
  bool shouldRepaint(ModernGridPainter oldDelegate) => true;
}
