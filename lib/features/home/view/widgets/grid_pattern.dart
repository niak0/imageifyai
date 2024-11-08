import 'package:flutter/material.dart';

class GridPattern extends StatelessWidget {
  const GridPattern({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GridPainter(),
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Noktalar için
    final dotPaint = Paint()
      ..color = const Color(0xFF8687E7).withOpacity(0.15)
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;

    // Büyük daireler için
    final circlePaint = Paint()
      ..color = const Color(0xFF6C72CB).withOpacity(0.03)
      ..style = PaintingStyle.fill;

    // Arka planda büyük daireler
    canvas.drawCircle(
      Offset(size.width * 0.2, size.height * 0.3),
      100,
      circlePaint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.8, size.height * 0.7),
      150,
      circlePaint,
    );

    // Nokta deseni
    const spacing = 30.0;
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(
          Offset(x, y),
          1,
          dotPaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
