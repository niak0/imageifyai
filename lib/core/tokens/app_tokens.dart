import 'package:flutter/material.dart';

abstract class AppTokens {
  /// 2
  static const double spacingXxs = 2;

  /// 4
  static const double spacingXs = 4;

  /// 8
  static const double spacingSm = 8;

  /// 16
  static const double spacingMd = 16;

  /// 24
  static const double spacingLg = 24;

  /// 32
  static const double spacingXl = 32;

  /// 40
  static const double spacingXxl = 40;

  // Border Radius
  /// 4
  static const double radiusXs = 4;

  /// 8
  static const double radiusSm = 8;

  /// 12
  static const double radiusMd = 12;

  /// 16
  static const double radiusLg = 16;

  /// 24
  static const double radiusXl = 24;

  /// 999
  static const double radiusFull = 999;

  // Font Sizes
  /// 12
  static const double fontXs = 12;

  /// 14
  static const double fontSm = 14;

  /// 16
  static const double fontMd = 16;

  /// 18
  static const double fontLg = 18;

  /// 20
  static const double fontXl = 20;

  /// 24
  static const double fontXxl = 24;

  // Icon Sizes
  /// 16
  static const double iconXs = 16;

  /// 20
  static const double iconSm = 20;

  /// 24
  static const double iconMd = 24;

  /// 32
  static const double iconLg = 32;

  /// 40
  static const double iconXl = 40;

  // Elevation
  /// 2
  static const double elevationXs = 2;

  /// 4
  static const double elevationSm = 4;

  /// 8
  static const double elevationMd = 8;

  /// 16
  static const double elevationLg = 16;

  /// 24
  static const double elevationXl = 24;

  // Common EdgeInsets
  /// EdgeInsets.all(8)
  static const paddingAllSm = EdgeInsets.all(spacingSm);

  /// EdgeInsets.all(16)
  static const paddingAllMd = EdgeInsets.all(spacingMd);

  /// EdgeInsets.all(24)
  static const paddingAllLg = EdgeInsets.all(spacingLg);

  /// EdgeInsets.symmetric(horizontal: 16)
  static const paddingHorizontal = EdgeInsets.symmetric(horizontal: spacingMd);

  /// EdgeInsets.symmetric(vertical: 16)
  static const paddingVertical = EdgeInsets.symmetric(vertical: spacingMd);

  /// EdgeInsets.symmetric(horizontal: 8)
  static const paddingHorizontalSm = EdgeInsets.symmetric(horizontal: spacingSm);

  /// EdgeInsets.symmetric(vertical: 8)
  static const paddingVerticalSm = EdgeInsets.symmetric(vertical: spacingSm);

  // Common Gaps
  /// SizedBox(height: 2, width: 2)
  static const gapXs = SizedBox(height: spacingXs, width: spacingXs);

  /// SizedBox(height: 8, width: 8)
  static const gapSm = SizedBox(height: spacingSm, width: spacingSm);

  /// SizedBox(height: 16, width: 16)
  static const gapMd = SizedBox(height: spacingMd, width: spacingMd);

  /// SizedBox(height: 24, width: 24)
  static const gapLg = SizedBox(height: spacingLg, width: spacingLg);

  /// SizedBox(height: 40, width: 40)
  static const gapXl = SizedBox(height: spacingXl, width: spacingXl);

  // Vertical Gaps
  /// SizedBox(height: 2)
  static const vGapXs = SizedBox(height: spacingXs);

  /// SizedBox(height: 8)
  static const vGapSm = SizedBox(height: spacingSm);

  /// SizedBox(height: 16)
  static const vGapMd = SizedBox(height: spacingMd);

  /// SizedBox(height: 24)
  static const vGapLg = SizedBox(height: spacingLg);

  /// SizedBox(height: 40)
  static const vGapXl = SizedBox(height: spacingXl);

  // Horizontal Gaps
  /// SizedBox(width: 2)
  static const hGapXs = SizedBox(width: spacingXs);

  /// SizedBox(width: 8)
  static const hGapSm = SizedBox(width: spacingSm);

  /// SizedBox(width: 16)
  static const hGapMd = SizedBox(width: spacingMd);

  /// SizedBox(width: 24)
  static const hGapLg = SizedBox(width: spacingLg);

  /// SizedBox(width: 40)
  static const hGapXl = SizedBox(width: spacingXl);
}
