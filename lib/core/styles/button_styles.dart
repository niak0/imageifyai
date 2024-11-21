import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/app_tokens.dart';

/// Buton stilleri için yardımcı sınıf
abstract class ButtonStyles {
  // Temel buton özellikleri
  static const _defaultRadius = AppTokens.radiusMd;
  static const _defaultElevation = 0.0;

  /// Primary buton stili
  static ButtonStyle primary({
    Color? color,
    Size? size,
  }) {
    final buttonColor = color ?? AppColors.primary;

    return ElevatedButton.styleFrom(
      backgroundColor: buttonColor.withOpacity(0.2),
      foregroundColor: buttonColor,
      elevation: _defaultElevation,
      padding: _getPadding(size),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_defaultRadius),
        side: BorderSide(
          color: buttonColor.withOpacity(0.5),
          width: 1.5,
        ),
      ),
    ).copyWith(
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return buttonColor.withOpacity(0.1);
        }
        return null;
      }),
    );
  }

  /// Secondary buton stili
  static ButtonStyle secondary({
    Color? color,
    Size? size,
  }) {
    final buttonColor = color ?? AppColors.secondary;

    return ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor: buttonColor,
      elevation: _defaultElevation,
      padding: _getPadding(size),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_defaultRadius),
        side: BorderSide(
          color: buttonColor.withOpacity(0.5),
          width: 1.5,
        ),
      ),
    );
  }

  /// Text buton stili
  static ButtonStyle text({
    Color? color,
    Size? size,
  }) {
    return TextButton.styleFrom(
      foregroundColor: color ?? AppColors.text,
      padding: _getPadding(size),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_defaultRadius),
      ),
    );
  }

  /// Buton boyutuna göre padding değerini döndürür
  static EdgeInsets _getPadding(Size? size) {
    if (size == null) return AppTokens.paddingAllMd;

    if (size == const Size.square(32)) {
      return AppTokens.paddingAllSm;
    } else if (size == const Size.square(48)) {
      return AppTokens.paddingAllLg;
    }

    return AppTokens.paddingAllMd;
  }
}

/// Kullanım örneği:
/// ```dart
/// ElevatedButton(
///   style: ButtonStyles.primary(),
///   onPressed: () {},
///   child: Text('Primary Button'),
/// )
/// 
/// TextButton(
///   style: ButtonStyles.text(),
///   onPressed: () {},
///   child: Text('Text Button'),
/// )
/// ```
