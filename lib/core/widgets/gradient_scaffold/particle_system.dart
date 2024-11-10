import 'dart:math' as math;
import 'package:flutter/material.dart';

class Particle {
  late double x;
  late double y;
  late double speed;
  late double theta;
  late double radius;
  // Hız sabitleri
  static const double particleSpeed = 0.02; // Yavaş ve sabit hız
  static const double deltaTime = 0.016; // Sabit delta (yaklaşık 60 FPS)

  Particle.random() {
    _initialize();
  }

  void _initialize() {
    final random = math.Random();
    x = random.nextDouble();
    y = random.nextDouble();
    // Hızı minSpeed ile maxSpeed arasında ayarla
    speed = particleSpeed;
    theta = random.nextDouble() * 2 * math.pi; // Rastgele yön
    radius = 1 + random.nextDouble() * 2; // 1-3px arası yarıçap
  }

  void update(Size size, double delta) {
    // Yeni pozisyonu hesapla
    x += math.cos(theta) * speed * deltaTime;
    y += math.sin(theta) * speed * deltaTime;

    // Ekran sınırlarını kontrol et ve wrap-around uygula
    if (x < 0) {
      x = 1.0; // Sağ taraftan geri gir
    } else if (x > 1) {
      x = 0.0; // Sol taraftan geri gir
    }

    if (y < 0) {
      y = 1.0; // Alt taraftan geri gir
    } else if (y > 1) {
      y = 0.0; // Üst taraftan geri gir
    }
  }
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final Color color;
  final Animation<double> animation;
  final double maxDistance;
  // Maksimum doku boyutu
  static const double maxTextureSize = 8192.0;

  // Pozisyonları tutacak liste
  late final List<Offset> _positions;
  late final Paint _paint;

  ParticlePainter({
    required this.particles,
    required this.color,
    required this.animation,
    this.maxDistance = 100.0, // Mesafeyi azalttık
  }) {
    _paint = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

    // Pozisyon listesini başlangıçta oluştur
    _positions = List.filled(particles.length, Offset.zero);
  }

  @override
  void paint(Canvas canvas, Size size) {
    // Boyut kontrolü
    final scale = math.min(
      maxTextureSize / size.width,
      maxTextureSize / size.height,
    );
    if (scale < 1.0) {
      size = Size(
        size.width * scale,
        size.height * scale,
      );
    }
    // Parçacıkları güncelle
    for (var i = 0; i < particles.length; i++) {
      particles[i].update(size, animation.value);
      _positions[i] = Offset(
        particles[i].x * size.width,
        particles[i].y * size.height,
      );
    }
    // Bağlantıları çiz
    for (var i = 0; i < _positions.length; i++) {
      final p1 = _positions[i];
      for (var j = i + 1; j < _positions.length; j++) {
        final p2 = _positions[j];
        final dx = p1.dx - p2.dx;
        final dy = p1.dy - p2.dy;
        final distance = math.sqrt(dx * dx + dy * dy);

        if (distance < maxDistance) {
          final opacity = (1 - distance / maxDistance) * 0.2;
          _paint.color = color.withOpacity(opacity);
          canvas.drawLine(p1, p2, _paint);
        }
      }
    }

    // Parçacıkları çiz
    _paint.color = color.withOpacity(0.6);
    for (var i = 0; i < particles.length; i++) {
      canvas.drawCircle(_positions[i], particles[i].radius, _paint);
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
