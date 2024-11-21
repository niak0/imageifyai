import 'dart:math';
import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/colors.dart';

class ParticleNetwork extends StatefulWidget {
  const ParticleNetwork({super.key});

  @override
  State<ParticleNetwork> createState() => _ParticleNetworkState();
}

class _ParticleNetworkState extends State<ParticleNetwork> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Particle> particles = [];
  final Random random = Random();
  final int particleCount = 15;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    // Parçacıkları oluştur
    for (int i = 0; i < particleCount; i++) {
      particles.add(Particle(random));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Parçacıkları hareket ettir
        for (var particle in particles) {
          particle.move();
        }
        return CustomPaint(
          painter: ParticleNetworkPainter(
            particles: particles,
            animation: _controller.value,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}

class ParticleNetworkPainter extends CustomPainter {
  final List<Particle> particles;
  final double animation;
  final double maxDistance = 100.0;

  ParticleNetworkPainter({
    required this.particles,
    required this.animation,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      // Parçacıkları çiz - daha parlak ve yıldız benzeri
      final paint = Paint()
        ..color = AppColors.primary.withOpacity(0.8)
        ..style = PaintingStyle.fill
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2); // Glow efekti

      canvas.drawCircle(
        Offset(
          particle.x * size.width,
          particle.y * size.height,
        ),
        1.5, // Daha küçük parçacıklar
        paint,
      );

      // Parçacıklar arası bağlantıları çiz
      for (var other in particles) {
        if (particle != other) {
          final dx = (particle.x - other.x) * size.width;
          final dy = (particle.y - other.y) * size.height;
          final distance = sqrt(dx * dx + dy * dy);

          if (distance < maxDistance) {
            final opacity = (1 - distance / maxDistance) * 0.3; // Daha hafif çizgiler
            final linePaint = Paint()
              ..color = AppColors.primary.withOpacity(opacity)
              ..strokeWidth = 0.5 // Daha ince çizgiler
              ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 0.5); // Hafif blur

            canvas.drawLine(
              Offset(particle.x * size.width, particle.y * size.height),
              Offset(other.x * size.width, other.y * size.height),
              linePaint,
            );
          }
        }
      }
    }
  }

  @override
  bool shouldRepaint(ParticleNetworkPainter oldDelegate) => true;
}

class Particle {
  double x;
  double y;
  double speedX;
  double speedY;
  final Random random;

  Particle(this.random)
      : x = random.nextDouble(),
        y = random.nextDouble(),
        speedX = (random.nextDouble() - 0.5) * 0.002,
        speedY = (random.nextDouble() - 0.5) * 0.002;

  void move() {
    x += speedX;
    y += speedY;

    // Sınırları kontrol et
    if (x < 0 || x > 1) speedX *= -1;
    if (y < 0 || y > 1) speedY *= -1;
  }
}
