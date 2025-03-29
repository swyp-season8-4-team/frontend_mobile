import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';

class CustomFillButton extends StatelessWidget {
  const CustomFillButton({
    required this.label,
    required this.onPressed,
    this.disabled = false,
    this.primary = true,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool disabled;

  /// primary가 true면 Honey, false면 Olive
  final bool primary;

  WidgetStateProperty<Color?> get _foregroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          return primary ? ScaleColorConfig.primary20 : ScaleColorConfig.white;
        }

        /// Disabled
        if (states.contains(WidgetState.disabled)) {
          return ScaleColorConfig.neutral50;
        }

        /// Enabled
        return primary ? ScaleColorConfig.primary20 : ScaleColorConfig.white;
      });

  WidgetStateProperty<Color?> get _backgroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          return primary
              ? ScaleColorConfig.primary70
              : ScaleColorConfig.secondary30;
        }

        /// Disabled
        if (states.contains(WidgetState.disabled)) {
          return ScaleColorConfig.neutral70;
        }

        /// Enabled
        return primary
            ? ScaleColorConfig.primary80
            : ScaleColorConfig.secondary40;
      });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: 159,
      child: FilledButton(
        onPressed: !disabled ? onPressed : null,
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          minimumSize: Size.zero,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          elevation: 0,
          textStyle: textTheme.titleMedium,
        ).copyWith(
          foregroundColor: _foregroundColor,
          backgroundColor: _backgroundColor,
        ),
        child: Text(label),
      ),
    );
  }
}
