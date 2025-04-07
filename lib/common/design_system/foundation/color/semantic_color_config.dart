import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';

class SemanticColorConfig {
  // Primary: Honey yellow
  static Color primary = ScaleColorConfig.primary80;
  static Color onPrimary = ScaleColorConfig.primary100;
  static Color primaryContainer = ScaleColorConfig.primary90;
  static Color onPrimaryContainer = ScaleColorConfig.primary10;

  // Secondary: Olive brown
  static Color secondary = ScaleColorConfig.secondary40;
  static Color onSecondary = ScaleColorConfig.secondary100;
  static Color secondaryContainer = ScaleColorConfig.secondary90;
  static Color onSecondaryContainer = ScaleColorConfig.secondary10;

  // Success
  static Color success = ScaleColorConfig.success50;
  static Color onSuccess = ScaleColorConfig.success100;
  static Color successContainer = ScaleColorConfig.success90;
  static Color onSuccessContainer = ScaleColorConfig.success10;

  // Error
  static Color error = ScaleColorConfig.error40;
  static Color onError = ScaleColorConfig.error100;
  static Color errorContainer = ScaleColorConfig.error90;
  static Color onErrorContainer = ScaleColorConfig.error10;

  // Surface
  static Color surface = ScaleColorConfig.surface90;
  static Color onSurface = ScaleColorConfig.neutral10;
  static Color onSurfaceVarient = ScaleColorConfig.neutral40;
  static Color surfaceContainerLowest = ScaleColorConfig.surface90;
  static Color surfaceContainerLow = ScaleColorConfig.surface80;
  static Color surfaceContainer = ScaleColorConfig.surface70;
  static Color surfaceContainerHigh = ScaleColorConfig.surface60;
  static Color surfaceContainerHighest = ScaleColorConfig.surface50;

  // Inverse
  static Color inverseSurface = ScaleColorConfig.neutral20;
  static Color onInverseSurface = ScaleColorConfig.neutral80;
  static Color inversePrimary = ScaleColorConfig.primary80;

  // Outline
  static Color outline = ScaleColorConfig.neutral50;
  static Color outlineVarient = ScaleColorConfig.neutral70;

  // Accent
  static Color accentYellow = const Color(0xFFFFC803);
  static Color accentOrange = const Color(0xFFFF8803);
  static Color accentGreen = const Color(0xFF05D352);
  static Color accentOcean = const Color(0xFF00C6D8);
  static Color accentBlue = const Color(0xFF0066FF);
  static Color accentRed = const Color(0xFFFF2D31);
}
