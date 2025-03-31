import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

class CustomPillButton extends StatelessWidget {
  const CustomPillButton({
    required this.label,
    required this.onPressed,
    required this.svg,
    this.disabled = false,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final SvgGenImage svg;
  final bool disabled;

  WidgetStateProperty<Color?> get _foregroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          return ScaleColorConfig.neutral20;
        }

        /// Disabled
        if (states.contains(WidgetState.disabled)) {
          return ScaleColorConfig.neutral50;
        }

        /// Enabled
        return ScaleColorConfig.neutral20;
      });

  WidgetStateProperty<Color?> get _backgroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          return ScaleColorConfig.surface60;
        }

        /// Disabled
        if (states.contains(WidgetState.disabled)) {
          return ScaleColorConfig.neutral70;
        }

        /// Enabled
        return ScaleColorConfig.neutral70;
      });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return FilledButton(
      onPressed: !disabled ? onPressed : null,
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
        minimumSize: Size.zero,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: 0,
        textStyle: textTheme.titleMedium,
      ).copyWith(
        foregroundColor: _foregroundColor,
        backgroundColor: _backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SvgPicture.asset(
            svg.path,
            colorFilter:
                !disabled
                    ? null
                    : const ColorFilter.mode(
                      ScaleColorConfig.neutral50,
                      BlendMode.srcIn,
                    ),
          ),
          const SizedBox(width: 10),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
