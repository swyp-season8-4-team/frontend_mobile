import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.label,
    required this.onPressed,
    this.svg,
    this.disabled = false,
    super.key,
  }) : underline = false;

  const CustomTextButton.underline({
    required this.label,
    required this.onPressed,
    this.disabled = false,
    super.key,
  }) : svg = null,
       underline = true;

  final String label;
  final VoidCallback? onPressed;
  final bool disabled;
  final SvgGenImage? svg;
  final bool underline;

  WidgetStateProperty<Color?> get _foregroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          return !underline
              ? ScaleColorConfig.primary60
              : ScaleColorConfig.secondary10;
        }

        /// Disabled
        if (states.contains(WidgetState.disabled)) {
          return !underline
              ? ScaleColorConfig.neutral50
              : ScaleColorConfig.neutral40;
        }

        /// Enabled
        return !underline
            ? ScaleColorConfig.primary60
            : ScaleColorConfig.secondary30;
      });

  WidgetStateProperty<Color?> get _backgroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          return !underline ? ScaleColorConfig.surface80 : Colors.transparent;
        }

        /// Disabled
        if (states.contains(WidgetState.disabled)) {
          return !underline ? Colors.transparent : null;
        }

        /// Enabled
        return Colors.transparent;
      });

  WidgetStateProperty<TextStyle?> _textStyle({required TextTheme textTheme}) =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          return !underline
              ? textTheme.bodySmall
              : textTheme.labelLarge?.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: ScaleColorConfig.secondary10,
              );
        }

        /// Disabled
        if (states.contains(WidgetState.disabled)) {
          return !underline
              ? textTheme.bodySmall
              : textTheme.labelLarge?.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: ScaleColorConfig.neutral40,
              );
        }

        /// Enabled
        return !underline
            ? textTheme.bodySmall
            : textTheme.labelLarge?.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: ScaleColorConfig.secondary30,
            );
      });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return TextButton(
      onPressed: !disabled ? onPressed : null,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        minimumSize: Size.zero,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: 0,
      ).copyWith(
        foregroundColor: _foregroundColor,
        backgroundColor: _backgroundColor,
        textStyle: _textStyle(textTheme: textTheme),
        overlayColor:
            underline ? null : WidgetStateProperty.all(Colors.transparent),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[Text(label, textAlign: TextAlign.center)],
      ),
    );
  }
}
