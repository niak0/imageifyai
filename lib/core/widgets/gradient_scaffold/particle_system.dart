import 'dart:math' as math;
import 'package:flutter/material.dart';

class Particle {
  late double x;
  late double y;
  late double speed;
  late double theta;
  late double radius;

  Particle.random() {
    _initialize();
  }

  void _initialize() {
    final random = math.Random();
    x = random.nextDouble();
    y = random.nextDouble();
    speed = 0.2 + random.nextDouble() * 0.3; // 0.2 ile 0.5 arası hız
    theta = random.nextDouble() * 2 * math.pi; // Rastgele yön
    radius = 1 + random.nextDouble() * 2; // 1-3px arası yarıçap
  }

  void update(Size size, double delta) {
    x += math.cos(theta) * speed * delta;
    y += math.sin(theta) * speed * delta;

    // Ekran sınırlarını kontrol et
    if (x < 0 || x > size.width) {
      theta = math.pi - theta;
    }
    if (y < 0 || y > size.height) {
      theta = -theta;
    }
  }
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final Color color;
  final Animation<double> animation;
  final double maxDistance = 150.0; // Parçacıklar arası maksimum bağlantı mesafesi

  ParticlePainter({
    required this.particles,
    required this.color,
    required this.animation,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Parçacıkları güncelle
    for (var particle in particles) {
      particle.update(size, animation.value);
    }

    final paint = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

    // Parçacıklar arası çizgiler
    for (var i = 0; i < particles.length; i++) {
      for (var j = i + 1; j < particles.length; j++) {
        final p1 = particles[i];
        final p2 = particles[j];

        final dx = (p1.x - p2.x) * size.width;
        final dy = (p1.y - p2.y) * size.height;
        final distance = math.sqrt(dx * dx + dy * dy);

        if (distance < maxDistance) {
          final opacity = (1 - distance / maxDistance) * 0.2;
          paint.color = color.withOpacity(opacity);

          canvas.drawLine(
            Offset(p1.x * size.width, p1.y * size.height),
            Offset(p2.x * size.width, p2.y * size.height),
            paint,
          );
        }
      }
    }

    // Parçacıkları çiz
    paint.color = color.withOpacity(0.6);
    for (var particle in particles) {
      canvas.drawCircle(
        Offset(particle.x * size.width, particle.y * size.height),
        particle.radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(ParticlePainter oldDelegate) => true;
}

class ParticleSystem extends StatefulWidget {
  final Color particleColor;
  final int particleCount;

  const ParticleSystem({
    super.key,
    this.particleColor = const Color(0xFF8687E7),
    this.particleCount = 50,
  });

  @override
  State<ParticleSystem> createState() => _ParticleSystemState();
}

class _ParticleSystemState extends State<ParticleSystem> with SingleTickerProviderStateMixin {
  late List<Particle> particles;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _initializeParticles();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  void _initializeParticles() {
    particles = List.generate(
      widget.particleCount,
      (index) => Particle.random(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: ParticlePainter(
            particles: particles,
            color: widget.particleColor,
            animation: _controller,
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
