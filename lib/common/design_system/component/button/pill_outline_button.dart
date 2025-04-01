import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

class CustomPillOutlineButton extends StatelessWidget {
  const CustomPillOutlineButton({
    required this.label,
    required this.onPressed,
    required this.isSelected,
    required this.selectedHandler,
    this.width,
    this.disabled = false,
    this.svg,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isSelected;
  final VoidCallback? selectedHandler;
  final double? width;
  final bool disabled;
  final SvgGenImage? svg;

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

  void _onPressed() {
    if (onPressed != null) {
      onPressed!();
    }

    if (selectedHandler != null) {
      selectedHandler!();
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: width ?? double.infinity,
      child: OutlinedButton(
        onPressed: !disabled ? _onPressed : null,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(99),
          ),
          minimumSize: Size.zero,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          elevation: 0,
          textStyle: textTheme.titleMedium,
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
