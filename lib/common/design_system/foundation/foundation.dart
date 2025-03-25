import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/semantic_color_config.dart';
import 'package:frontend_mobile/common/design_system/foundation/typography/typography_config.dart';

class CustomFoundation {
  static TextTheme textTheme = const TextTheme(
    // Display
    displayLarge: TypographyConfig.displayLarge,
    displayMedium: TypographyConfig.displayMedium,
    displaySmall: TypographyConfig.displaySmall,

    // Headline
    headlineLarge: TypographyConfig.headlineLarge,
    headlineMedium: TypographyConfig.headlineMedium,
    headlineSmall: TypographyConfig.headlineSmall,

    // Title
    titleLarge: TypographyConfig.titleLarge,
    titleMedium: TypographyConfig.titleMedium,
    titleSmall: TypographyConfig.titleSmall,

    // Label
    labelLarge: TypographyConfig.labelLarge,
    labelMedium: TypographyConfig.labelMedium,
    labelSmall: TypographyConfig.labelSmall,

    // Body
    bodyLarge: TypographyConfig.bodyLarge,
    bodyMedium: TypographyConfig.bodyMedium,
    bodySmall: TypographyConfig.bodySmall,
  );

  static ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.light,

    // Primary: Honey yellow
    primary: SemanticColorConfig.primary,
    onPrimary: SemanticColorConfig.onPrimary,
    primaryContainer: SemanticColorConfig.primaryContainer,
    onPrimaryContainer: SemanticColorConfig.onPrimaryContainer,

    // Secondary: Olive brown
    secondary: SemanticColorConfig.secondary,
    onSecondary: SemanticColorConfig.onSecondary,
    secondaryContainer: SemanticColorConfig.secondaryContainer,
    onSecondaryContainer: SemanticColorConfig.onSecondaryContainer,

    // Error
    error: SemanticColorConfig.error,
    onError: SemanticColorConfig.onError,
    errorContainer: SemanticColorConfig.errorContainer,
    onErrorContainer: SemanticColorConfig.onErrorContainer,

    // Surface
    surface: SemanticColorConfig.surface,
    onSurface: SemanticColorConfig.onSurface,
    onSurfaceVariant: SemanticColorConfig.onSurfaceVarient,
    surfaceContainerLowest: SemanticColorConfig.surfaceContainerLowest,
    surfaceContainerLow: SemanticColorConfig.surfaceContainerLow,
    surfaceContainerHigh: SemanticColorConfig.surfaceContainerHigh,
    surfaceContainerHighest: SemanticColorConfig.surfaceContainerHighest,

    // Inverse
    inverseSurface: SemanticColorConfig.inverseSurface,
    onInverseSurface: SemanticColorConfig.onInverseSurface,
    inversePrimary: SemanticColorConfig.inversePrimary,

    // Outline
    outline: SemanticColorConfig.outline,
    outlineVariant: SemanticColorConfig.outlineVarient,
  );
}

extension ColorSchemeExt on ColorScheme {
  // Success
  Color get success => SemanticColorConfig.success;
  Color get onSuccess => SemanticColorConfig.onSuccess;
  Color get successContainer => SemanticColorConfig.successContainer;
  Color get onSuccessContainer => SemanticColorConfig.onSuccessContainer;
}
