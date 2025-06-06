import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';

enum CustomFillButtonColor { honey, olive, green }

enum CustomFillButtonSize { large, medium, small, xSmall }

class CustomFillButton extends StatelessWidget {
  const CustomFillButton.large({
    required this.label,
    required this.onPressed,
    this.width,
    this.disabled = false,
    this.backgroundColor = CustomFillButtonColor.honey,
    super.key,
  }) : size = CustomFillButtonSize.large;

  const CustomFillButton.medium({
    required this.label,
    required this.onPressed,
    this.width,
    this.disabled = false,
    this.backgroundColor = CustomFillButtonColor.honey,
    super.key,
  }) : size = CustomFillButtonSize.medium;

  const CustomFillButton.small({
    required this.label,
    required this.onPressed,
    this.width,
    this.disabled = false,
    this.backgroundColor = CustomFillButtonColor.honey,
    super.key,
  }) : size = CustomFillButtonSize.small;

  const CustomFillButton.xSmall({
    required this.label,
    required this.onPressed,
    this.width,
    this.disabled = false,
    this.backgroundColor = CustomFillButtonColor.honey,
    super.key,
  }) : size = CustomFillButtonSize.xSmall;

  final String label;
  final VoidCallback? onPressed;
  final double? width;
  final bool disabled;
  final CustomFillButtonColor backgroundColor;
  final CustomFillButtonSize size;

  TextStyle? _textStyle({required BuildContext context}) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    switch (size) {
      case CustomFillButtonSize.large:
      case CustomFillButtonSize.medium:
        return textTheme.titleMedium;

      case CustomFillButtonSize.small:
        return textTheme.titleSmall;

      case CustomFillButtonSize.xSmall:
        return textTheme.labelLarge;
    }
  }

  WidgetStateProperty<Color?> get _foregroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          switch (backgroundColor) {
            case CustomFillButtonColor.honey:
              return ScaleColorConfig.primary20;

            case CustomFillButtonColor.olive:
            case CustomFillButtonColor.green:
              return Colors.white;
          }
        }

        /// Disabled
        if (states.contains(WidgetState.disabled)) {
          return ScaleColorConfig.neutral50;
        }

        /// Enabled
        switch (backgroundColor) {
          case CustomFillButtonColor.honey:
            return ScaleColorConfig.primary20;

          case CustomFillButtonColor.olive:
          case CustomFillButtonColor.green:
            return Colors.white;
        }
      });

  WidgetStateProperty<Color?> get _backgroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          switch (backgroundColor) {
            case CustomFillButtonColor.honey:
              return ScaleColorConfig.primary70;

            case CustomFillButtonColor.olive:
              return ScaleColorConfig.secondary30;

            case CustomFillButtonColor.green:
              return ScaleColorConfig.success30;
          }
        }

        /// Disabled
        if (states.contains(WidgetState.disabled)) {
          return ScaleColorConfig.neutral70;
        }

        /// Enabled
        switch (backgroundColor) {
          case CustomFillButtonColor.honey:
            return ScaleColorConfig.primary80;

          case CustomFillButtonColor.olive:
            return ScaleColorConfig.secondary40;

          case CustomFillButtonColor.green:
            return ScaleColorConfig.success50;
        }
      });

  EdgeInsets get _padding {
    switch (size) {
      case CustomFillButtonSize.large:
      case CustomFillButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 10.5);

      case CustomFillButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 10);

      case CustomFillButtonSize.xSmall:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: FilledButton(
        onPressed: !disabled ? onPressed : null,
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          minimumSize: Size.zero,
          padding: _padding,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          elevation: 0,
          animationDuration: Duration.zero,
          textStyle: _textStyle(context: context),
        ).copyWith(
          foregroundColor: _foregroundColor,
          backgroundColor: _backgroundColor,
        ),
        child: Text(label),
      ),
    );
  }
}
