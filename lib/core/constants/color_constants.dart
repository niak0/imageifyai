import 'package:flutter/material.dart';

/// Uygulama genelinde kullanılan renk tanımlamaları
class AppColors {
  // ana
  static const Color primary = Color(0xFF00F5FF); //0xFF00F5FF
  static const Color secondary = Color(0xFFBF00FF); // 8A2BE2 bunu dene
  static const Color tertiary = Color(0xFFFF00FF); // FF007F bunu dene
  static const Color text = Color(0xFFFFFFFF);
  static const Color textLow = Color(0xFFB0B0B0);

  static const Color primaryBackground = Color(0xFF0A0E17);

  static const Color tools = Color(0xFF00E676);
  static const Color toolsBackground = Color(0xFF002B1D);

  static const Color utility = Color(0xFF8687E7);
  static const Color utilityBackground = Color(0xFF1A1A2E);

  static const Color surface = Color(0xFF15151F);
  static const Color surfaceLight = Color(0xFF1C1C28);
  static const Color surfaceDark = Color(0xFF0F0F16);
  static const Color surfaceVariant = Color(0xFF1F1F2C);

  // Metin Renkleri (Daha parlak)
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

  // Gradient güncelleme
  static const List<Color> backgroundDecoration = [
    Color(0xFF0D1321), // Koyu siber mavi
    Color(0xFF070D19), // Daha koyu ton
  ];

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

// Cam efekti için gradient
  static const List<Color> glassGradient = [
    Color(0x0FFFFFFF), // Beyaz %6 opaklık
    Color(0x05FFFFFF), // Beyaz %2 opaklık
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
