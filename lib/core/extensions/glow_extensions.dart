import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/colors.dart';

/// Icon Extension
extension ThemedIconExtension on Icon {
  /// Icon'a glow efekti ekler
  ///
  /// [color] - Glow ve icon rengi. Belirtilmezse [AppColors.primary] kullanılır
  /// [glowOpacity] - Glow efekti opaklığı. Varsayılan: 1.0
  /// [blurRadius] - Glow yumuşaklığı. Varsayılan: 1.0
  ///
  Widget withEffect({
    Color? color,
    double glowOpacity = 1.0,
    double blurRadius = 1.0,
  }) {
    final effectColor = color ?? AppColors.primary;
    return Icon(
      icon,
      size: size,
      color: effectColor,
      shadows: [
        Shadow(
          color: effectColor.withOpacity(glowOpacity),
          blurRadius: blurRadius,
        ),
      ],
    );
  }
}

/// Text widget'ı için glow efekti extension'ı
extension ThemedTextExtension on Text {
  /// Text'e glow efekti ekler
  ///
  /// [color] - Glow ve text rengi. Belirtilmezse [AppColors.primary] kullanılır
  /// [textOpacity] - Text opaklığı. Varsayılan: 1.0
  /// [glowOpacity] - Glow efekti opaklığı. Varsayılan: 1.0
  /// [blurRadius] - Glow yumuşaklığı. Varsayılan: 1.0
  ///
  /// Örnek kullanım:
  /// ```dart
  /// Text('Hello').withEffect(
  ///   color: Colors.blue,
  ///   glowOpacity: 0.7,
  /// )
  /// ```
  Widget withEffect({
    Color? color,
    double textOpacity = 1.0,
    double glowOpacity = 1.0,
    double blurRadius = 1.0,
  }) {
    final effectColor = color ?? AppColors.primary;
    return Text(
      data ?? '',
      style: (style ?? const TextStyle()).copyWith(
        color: effectColor.withOpacity(textOpacity),
        shadows: [
          Shadow(
            color: effectColor.withOpacity(glowOpacity),
            blurRadius: blurRadius,
          ),
        ],
      ),
    );
  }
}

/// BoxDecoration için glow efekti extension'ı
extension GlowEffect on BoxDecoration {
  /// Decoration'a glow efekti ekler
  ///
  /// [glowColor] - Glow efektinin rengi. Belirtilmezse decoration'ın rengi kullanılır
  /// [blurRadius] - Glow efektinin yumuşaklığı. Varsayılan: 1.0
  /// [spreadRadius] - Glow efektinin yayılma miktarı. Varsayılan: 1.5
  /// [onlyBorder] - Sadece kenarlarda glow efekti olup olmayacağı. Varsayılan: false
  ///
  /// Örnek kullanımlar:
  /// ```dart
  /// // Tam glow efekti
  /// decoration: AppDecorations.baseContainer.withGlowEffect()
  ///
  /// // Sadece kenarlarda glow
  /// decoration: AppDecorations.transparentContainer.withGlowEffect(
  ///   onlyBorder: true,
  /// )
  /// ```
  BoxDecoration withGlowEffect({
    Color? glowColor,
    double blurRadius = 2.0,
    double spreadRadius = 1.5,
    double opacity = 0.3,
    bool intenseGlow = false,
  }) {
    final effectColor = glowColor ?? AppColors.primary;

    return copyWith(
      boxShadow: [
        BoxShadow(
          color: effectColor.withOpacity(intenseGlow ? opacity * 3 : opacity),
          blurRadius: intenseGlow ? blurRadius * 3 : blurRadius,
          spreadRadius: intenseGlow ? spreadRadius * 3 : spreadRadius,
        ),
      ],
    );
  }
}
