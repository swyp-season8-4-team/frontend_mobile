import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

enum CustomPillOutlineButtonSize { medium, small, xSmall }

class CustomPillOutlineButton extends StatelessWidget {
  const CustomPillOutlineButton.medium({
    required this.label,
    required this.onPressed,
    required this.isSelected,
    this.svg,
    this.width,
    this.disabled = false,
    super.key,
  }) : size = CustomPillOutlineButtonSize.medium;

  const CustomPillOutlineButton.small({
    required this.label,
    required this.onPressed,
    required this.isSelected,
    this.svg,
    this.width,
    this.disabled = false,
    super.key,
  }) : size = CustomPillOutlineButtonSize.small;

  const CustomPillOutlineButton.xSmall({
    required this.label,
    required this.onPressed,
    required this.isSelected,
    this.svg,
    this.width,
    this.disabled = false,
    super.key,
  }) : size = CustomPillOutlineButtonSize.xSmall;

  final String label;
  final VoidCallback? onPressed;
  final bool isSelected;
  final SvgGenImage? svg;
  final double? width;
  final bool disabled;
  final CustomPillOutlineButtonSize size;

  WidgetStateProperty<Color?> get _foregroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          return ScaleColorConfig.primary20;
        }

        /// Selected
        if (isSelected) {
          return ScaleColorConfig.primary20;
        }

        /// Disabled
        if (states.contains(WidgetState.disabled)) {
          return ScaleColorConfig.neutral50;
        }

        /// Enabled
        return ScaleColorConfig.primary20;
      });

  WidgetStateProperty<Color?> get _backgroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          return ScaleColorConfig.surface80;
        }

        /// Selected
        if (isSelected) {
          return ScaleColorConfig.primary90;
        }

        /// Disabled
        if (states.contains(WidgetState.disabled)) {
          return Colors.transparent;
        }

        /// Enabled
        return Colors.transparent;
      });

  WidgetStateProperty<BorderSide> get _side =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          return const BorderSide(color: ScaleColorConfig.neutral50);
        }

        /// Selected
        if (isSelected) {
          return const BorderSide(color: ScaleColorConfig.primary70);
        }

        /// Disabled
        if (states.contains(WidgetState.disabled)) {
          return const BorderSide(color: ScaleColorConfig.neutral70);
        }

        /// Enabled
        return const BorderSide(color: ScaleColorConfig.neutral50);
      });

  TextStyle? _textStyle({required TextTheme textTheme}) {
    if (size == CustomPillOutlineButtonSize.medium) {
      return textTheme.titleMedium;
    }

    if (size == CustomPillOutlineButtonSize.small) {
      return textTheme.titleSmall;
    }

    return textTheme.labelLarge;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: width ?? double.infinity,
      child: OutlinedButton(
        onPressed: !disabled ? onPressed : null,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(99),
          ),
          minimumSize: Size.zero,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          elevation: 0,
          textStyle: _textStyle(textTheme: textTheme),
        ).copyWith(
          foregroundColor: _foregroundColor,
          backgroundColor: _backgroundColor,
          side: _side,
        ),
        child: Row(
          children: <Widget>[
            if (svg != null) ...<Widget>[
              SvgPicture.asset(
                svg!.path,
                colorFilter:
                    !disabled
                        ? null
                        : const ColorFilter.mode(
                          ScaleColorConfig.neutral50,
                          BlendMode.srcIn,
                        ),
              ),
              const SizedBox(width: 10),
            ],
            Expanded(child: Text(label, textAlign: TextAlign.center)),
          ],
        ),
      ),
    );
  }
}
