import 'package:flutter/material.dart';

/// Uygulama genelinde kullanılan renk tanımlamaları
abstract class AppColors {
  // Ana Renkler
  static const primary = Color(0xFF00F5FF); //0xFF00F5FF
  static const secondary = Color(0xFFBF00FF); // 8A2BE2 bunu dene
  static const background = Color(0xFF131A24); // 0xFF1C1F2A
  static const card = Color(0xFF1C1F2A);
  static const onCard = Color(0xFF1C242F);
  static const border = Color(0xFF29303B);

  // Metin Renkleri
  static const text = Color(0xFFFFFFFF);
  static const textLow = Color(0xFFB0B0B0);

  // Yüzey Renkleri
  static const surface = Color(0xFF15151F);

  static const tertiary = Color(0xFFFF00FF); // FF007F bunu dene
  static const container = Color(0xFF2A2A30); // Neon Yeşil

  static const tools = Color(0xFF00E676);

  static const utility = Color(0xFF8687E7);

  // Durum Renkleri
  static const error = Color(0xFFFF0055);
  static const success = Color(0xFF2A2A30);
  static const warning = Color(0xFFFFB300);

  static const Color info = Color(0xFF00B3FF); // Neon Açık Mavi

  // Çizgi ve Kenarlık Renkleri (Daha belirgin)
  static const outline = Color(0xFF2F2F3F);
  static const outlineVariant = Color(0xFF3F3F52);

  // Gradient güncelleme
  static const List<Color> backgroundDecoration = [
    Color(0xFF2C2C32),
    Color(0xFF2A2A30),
  ];

  static Color withOpacity(Color color, {double? opacity}) {
    return color.withOpacity(opacity ?? 0.5);
  }
}
