import 'package:flutter/material.dart';

/// Uygulama genelinde kullanılan renk tanımlamaları
class AppColors {
  // Ana Renkler ve Tonları
  static const Color onPrimary = Color(0xFFFFFFFF); // Primary üzerinde beyaz

  static const Color primary = Color(0xFF6C72CB);
  static const Color primaryLight = Color(0xFF8687E7);
  static const Color primaryDark = Color(0xFF5156A6);
  static const Color primaryContainer = Color(0xFF4A4F9F);
  static const Color onPrimaryContainer = Color(0xFFE6E7FF);

  static const Color secondary = Color(0xFF8687E7);
  static const Color secondaryLight = Color(0xFFA5A6FF);
  static const Color secondaryDark = Color(0xFF6869B8);
  static const Color secondaryContainer = Color(0xFF6263AD);
  static const Color onSecondaryContainer = Color(0xFFF0F0FF);

  static const Color tertiary = Color(0xFF7C7FF3);
  static const Color tertiaryLight = Color(0xFF9EA1FF);
  static const Color tertiaryDark = Color(0xFF5A5DC4);
  static const Color tertiaryContainer = Color(0xFF5457B9);
  static const Color onTertiaryContainer = Color(0xFFEBECFF);

  // Gradyanlar
  static const List<Color> primaryGradient = [
    Color(0xFF6C72CB),
    Color(0xFF8687E7),
  ];

  static const List<Color> secondaryGradient = [
    Color(0xFF8687E7),
    Color(0xFFA5A6FF),
  ];

  static const List<Color> glassGradient = [
    Color(0x1AFFFFFF),
    Color(0x0AFFFFFF),
  ];

  // Arka Plan ve Yüzey Renkleri
  static const Color background = Color(0xFF0F0F0F);
  static const Color backgroundLight = Color(0xFF141414);
  static const Color backgroundDark = Color(0xFF0A0A0A);

  static const Color surface = Color(0xFF1A1A1A);
  static const Color surfaceLight = Color(0xFF202020);
  static const Color surfaceDark = Color(0xFF151515);
  static const Color surfaceVariant = Color(0xFF252525);

  // Metin Renkleri
  static const Color textPrimary = Color(0xFFFAFAFA);
  static const Color textSecondary = Color(0xFFABABAB);
  static const Color textTertiary = Color(0xFF808080);
  static const Color textDisabled = Color(0xFF666666);

  // Durum Renkleri
  static const Color success = Color(0xFF6C72CB); // Primary ile aynı
  static const Color successLight = Color(0xFF8687E7);
  static const Color successDark = Color(0xFF5156A6);

  static const Color error = Color(0xFFE26D5C);
  static const Color errorLight = Color(0xFFFF8A7A);
  static const Color errorDark = Color(0xFFB54F3E);

  static const Color warning = Color(0xFFFFB74D);
  static const Color warningLight = Color(0xFFFFCC80);
  static const Color warningDark = Color(0xFFF57C00);

  static const Color info = Color(0xFF64B5F6);
  static const Color infoLight = Color(0xFF90CAF9);
  static const Color infoDark = Color(0xFF1E88E5);

  // Çizgi ve Kenarlık Renkleri
  static const Color outline = Color(0xFF2F2F2F);
  static const Color outlineVariant = Color(0xFF3F3F3F);
  static const Color border = Color(0xFF2A2A2A);

  // Gölge ve Overlay Renkleri
  static const Color shadow = Color(0xFF000000);
  static const Color scrim = Color(0x99000000);
  static const Color overlay = Color(0x1AFFFFFF);

  // Özel Durum Renkleri
  static const Color shimmerBase = Color(0xFF262626);
  static const Color shimmerHighlight = Color(0xFF3D3D3D);

  static const Color divider = Color(0xFF2A2A2A);
  static const Color inactive = Color(0xFF404040);
  static const Color disabled = Color(0xFF333333);

  // Özel Renk Tonları Oluşturma
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
