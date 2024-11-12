import 'package:flutter/material.dart';
import 'package:imageifyai/product/tokens/colors.dart';

/// Container ve diğer widget'lar için temel dekorasyon stilleri
abstract class AppDecorations {
  /// Standart container dekorasyonu
  ///
  /// Primary renk ile oluşturulmuş, yarı saydam, yumuşak kenarlı container.
  /// Örnek kullanım:
  /// ```dart
  /// Container(
  ///   decoration: AppDecorations.baseContainer,
  ///   child: YourWidget(),
  /// )
  /// ```
  static BoxDecoration get baseContainer => BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.border,
          width: 1.0,
        ),
      );

  ///  Transparan container dekorasyonu
  ///
  /// [baseContainer] ile aynı özelliklere sahip fakat arkaplanı transparan.
  /// Genellikle [withGlowEffect] ile birlikte ve [onlyBorder: true] olarak kullanılır.
  ///
  /// Örnek kullanım:
  /// ```dart
  /// Container(
  ///   decoration: AppDecorations.transparentContainer.withGlowEffect(
  ///     onlyBorder: true,
  ///   ),
  ///   child: YourWidget(),
  /// )
  /// ```
  static BoxDecoration get transparentContainer => baseContainer.copyWith(
        color: Colors.transparent,
      );

  ///  Surface renkli container dekorasyonu
  ///
  /// [baseContainer] ile aynı özelliklere sahip fakat [AppColors.surface] rengini kullanır.
  static BoxDecoration get surfaceContainer => baseContainer.copyWith(
        color: AppColors.surface.withOpacity(0.8),
      );

  /// Secondary renkli container dekorasyonu
  ///
  /// [baseContainer] ile aynı özelliklere sahip fakat [AppColors.secondary] rengini kullanır.
  static BoxDecoration get secondaryContainer => baseContainer.copyWith(
        color: AppColors.secondary.withOpacity(0.8),
      );
}
