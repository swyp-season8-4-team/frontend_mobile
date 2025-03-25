import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/font_weight/font_weight_config.dart';

class TypographyConfig {
  // Display
  static const TextStyle displayLarge = TextStyle(
    fontSize: 45,
    fontWeight: FontWeightConfig.semibold,
    height: 52 / 45,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: 32,
    fontWeight: FontWeightConfig.semibold,
    height: 40 / 32,
  );

  static const TextStyle displaySmall = TextStyle(
    fontSize: 28,
    fontWeight: FontWeightConfig.semibold,
    height: 36 / 28,
  );

  // Headline
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeightConfig.semibold,
    height: 40 / 32,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeightConfig.medium,
    height: 36 / 28,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeightConfig.medium,
    height: 32 / 24,
  );

  // Title
  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeightConfig.medium,
    height: 28 / 22,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeightConfig.medium,
    height: 24 / 18,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightConfig.medium,
    height: 20 / 14,
    letterSpacing: -1.5,
  );

  // Label
  static const TextStyle labelLarge = TextStyle(
    fontSize: 12,
    fontWeight: FontWeightConfig.medium,
    height: 16 / 12,
    letterSpacing: -1.5,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 11,
    fontWeight: FontWeightConfig.medium,
    height: 16 / 11,
    letterSpacing: -1.5,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeightConfig.medium,
    height: 16 / 10,
    letterSpacing: -1.5,
  );

  // Body
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightConfig.regular,
    height: 24 / 16,
    letterSpacing: -1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightConfig.regular,
    height: 20 / 14,
    letterSpacing: -1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeightConfig.regular,
    height: 16 / 12,
    letterSpacing: -1.5,
  );
}
