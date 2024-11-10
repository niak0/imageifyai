import 'package:flutter/material.dart';

/// Uygulama genelinde kullanılan renk tanımlamaları
class AppColors {
  // Ana Renkler ve Tonları
  static const Color onPrimary = Color(0xFFFFFFFF);
  // Ek Neon Renkler
  static const Color neonGreen = Color(0xFF39FF14);

  // Ana renk (base)
  static const primary1 = Color(0xFF8687E7); // Neon Mor (mevcut)

  // Yardımcı araçlar
  static const utility = Color(0xFF00E676); // Neon Yeşil

  // AI üretim araçları
  static const aiTools = Color(0xFF00B0FF); // Neon Mavi

  // Opsiyonel: Özel araçlar
  static const special = Color(0xFFFF1744); // Neon Kırmızı

  // Neon Mavi tonları
  // static const Color primary = Color(0xFF00F5FF); // Parlak Cyan

  static const Color primary = Color(0xFF00F5FF); // Parlak Cyan
  static const Color primaryLight = Color(0xFF80F9FF); // Açık Neon Mavi
  static const Color primaryDark = Color(0xFF00C8D4); // Koyu Neon Mavi
  static const Color primaryContainer = Color(0xFF00B4BF);
  static const Color onPrimaryContainer = Color(0xFFE6FFFF);

  // Neon Mor tonları
  static const Color secondary = Color(0xFFBF00FF); // Parlak Mor
  static const Color secondaryLight = Color(0xFFD580FF); // Açık Neon Mor
  static const Color secondaryDark = Color(0xFF9900CC); // Koyu Neon Mor
  static const Color secondaryContainer = Color(0xFF8800B3);
  static const Color onSecondaryContainer = Color(0xFFF9E6FF);

  // Neon Pembe tonları
  static const Color tertiary = Color(0xFFFF00FF); // Parlak Magenta
  static const Color tertiaryLight = Color(0xFFFF80FF); // Açık Neon Pembe
  static const Color tertiaryDark = Color(0xFFCC00CC); // Koyu Neon Pembe
  static const Color tertiaryContainer = Color(0xFFB300B3);
  static const Color onTertiaryContainer = Color(0xFFFFE6FF);
  // Arka Plan ve Yüzey Renkleri (Daha koyu ve kontrast)
  static const Color background = Color(0xFF0A0A0F); // Çok koyu lacivert
  static const Color backgroundLight = Color(0xFF12121A);
  static const Color backgroundDark = Color(0xFF050508);

  static const Color surface = Color(0xFF15151F);
  static const Color surfaceLight = Color(0xFF1C1C28);
  static const Color surfaceDark = Color(0xFF0F0F16);
  static const Color surfaceVariant = Color(0xFF1F1F2C);

  // Metin Renkleri (Daha parlak)
  static const Color textPrimary = Color(0xFFFCFCFC);
  static const Color textSecondary = Color(0xFFB3B3CC);
  static const Color textTertiary = Color(0xFF8080A6);
  static const Color textDisabled = Color(0xFF666680);

  // Durum Renkleri (Neon versiyonları)
  static const Color success = Color(0xFF00FF9C); // Neon Yeşil
  static const Color successLight = Color(0xFF80FFCE);
  static const Color successDark = Color(0xFF00CC7D);

  static const Color error = Color(0xFFFF0055); // Neon Kırmızı
  static const Color errorLight = Color(0xFFFF80AA);
  static const Color errorDark = Color(0xFFCC0044);

  static const Color warning = Color(0xFFFFB300); // Neon Turuncu
  static const Color warningLight = Color(0xFFFFD980);
  static const Color warningDark = Color(0xFFCC8F00);

  static const Color info = Color(0xFF00B3FF); // Neon Açık Mavi
  static const Color infoLight = Color(0xFF80D9FF);
  static const Color infoDark = Color(0xFF008FCC);

  // Çizgi ve Kenarlık Renkleri (Daha belirgin)
  static const Color outline = Color(0xFF2F2F3F);
  static const Color outlineVariant = Color(0xFF3F3F52);
  static const Color border = Color(0xFF2A2A38);

  // Gölge ve Overlay Renkleri
  static const Color shadow = Color(0xFF000000);
  static const Color scrim = Color(0x99000000);
  static const Color overlay = Color(0x1AFFFFFF);

  // Özel Durum Renkleri
  static const Color shimmerBase = Color(0xFF262633);
  static const Color shimmerHighlight = Color(0xFF3D3D4F);

  static const Color divider = Color(0xFF2A2A38);
  static const Color inactive = Color(0xFF404052);
  static const Color disabled = Color(0xFF333342);

  /// Gradyanlar
// AI Araçları için - Neon Mavi tonları
  static const List<Color> aiToolsGradient = [
    Color(0x2600F5FF), // Neon Mavi %15 opaklık
    Color(0x1A00B0FF), // Koyu Mavi %10 opaklık
  ];

// Yardımcı Araçlar için - Neon Yeşil tonları
  static const List<Color> utilityGradient = [
    Color(0x2600E676), // Neon Yeşil %15 opaklık
    Color(0x1A00C853), // Koyu Yeşil %10 opaklık
  ];

// Premium/Özel Araçlar için - Neon Pembe ve Kırmızı
  static const List<Color> specialGradient = [
    Color(0x26FF00FF), // Neon Pembe %15 opaklık
    Color(0x1AFF1744), // Neon Kırmızı %10 opaklık
  ];

// Ana Gradient - Neon Mavi ve Mor
  static const List<Color> primaryGradient = [
    Color(0x2600F5FF), // Neon Mavi %15 opaklık
    Color(0x1ABF00FF), // Neon Mor %10 opaklık
  ];

// İkincil Gradient - Neon Mor ve Pembe
  static const List<Color> secondaryGradient = [
    Color(0x26BF00FF), // Neon Mor %15 opaklık
    Color(0x1AFF00FF), // Neon Pembe %10 opaklık
  ];

// Cam efekti için gradient
  static const List<Color> glassGradient = [
    Color(0x0FFFFFFF), // Beyaz %6 opaklık
    Color(0x05FFFFFF), // Beyaz %2 opaklık
  ];

// Neon Gradient - Mavi ve Yeşil
  static const List<Color> neonGradient = [
    Color(0x2600F5FF), // Neon Mavi %15 opaklık
    Color(0x1A39FF14), // Neon Yeşil %10 opaklık
  ];

// Tam Neon Gradient - Tüm renkler
  static const List<Color> fullNeonGradient = [
    Color(0x2600F5FF), // Neon Mavi %15 opaklık
    Color(0x1ABF00FF), // Neon Mor %10 opaklık
    Color(0x1AFF00FF), // Neon Pembe %10 opaklık
    Color(0x1A39FF14), // Neon Yeşil %10 opaklık
  ];

  // Opaklık Değerleri
  static const double glowOpacity = 0.15;
  static const double borderOpacity = 0.3;
  static const double shadowOpacity = 0.2;
  // Yeni Glow Efektleri
  static List<BoxShadow> neonGreenGlow({double opacity = 0.5}) => [
        BoxShadow(
          color: neonGreen.withOpacity(opacity),
          blurRadius: 8,
          spreadRadius: 1,
        ),
      ];

  static List<BoxShadow> tertiaryGlow({double opacity = 0.5}) => [
        BoxShadow(
          color: tertiary.withOpacity(opacity),
          blurRadius: 8,
          spreadRadius: 1,
        ),
      ];
  // Glow Efektleri
  static List<BoxShadow> primaryGlow({double opacity = 0.5}) => [
        BoxShadow(
          color: primary.withOpacity(opacity),
          blurRadius: 8,
          spreadRadius: 1,
        ),
      ];

  static List<BoxShadow> secondaryGlow({double opacity = 0.5}) => [
        BoxShadow(
          color: secondary.withOpacity(opacity),
          blurRadius: 8,
          spreadRadius: 1,
        ),
      ];

  // Özel Renk Tonları Oluşturma metodları aynı kalabilir
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }

  static Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  static Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }
}
