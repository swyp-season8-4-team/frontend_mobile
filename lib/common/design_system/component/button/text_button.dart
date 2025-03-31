import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

class CustomTextButton extends StatefulWidget {
  const CustomTextButton.svg({
    required this.label,
    required this.onPressed,
    required this.svg,
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

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  WidgetStateProperty<Color?> get _foregroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          return widget.svg != null
              ? ScaleColorConfig.primary60
              : ScaleColorConfig.secondary10;
        }

        /// Disabled
        if (states.contains(WidgetState.disabled)) {
          return widget.svg != null
              ? ScaleColorConfig.neutral50
              : ScaleColorConfig.neutral40;
        }

        /// Enabled
        return widget.svg != null
            ? ScaleColorConfig.primary60
            : ScaleColorConfig.secondary30;
      });

  WidgetStateProperty<Color?> get _backgroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          return widget.svg != null
              ? ScaleColorConfig.surface80
              : Colors.transparent;
        }

        /// Disabled
        if (states.contains(WidgetState.disabled)) {
          return widget.svg != null ? Colors.transparent : null;
        }

        /// Enabled
        return Colors.transparent;
      });

  WidgetStateProperty<TextStyle?> get _textStyle =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        final TextTheme textTheme = Theme.of(context).textTheme;

        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          return widget.svg != null
              ? textTheme.bodySmall
              : textTheme.labelLarge?.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: ScaleColorConfig.secondary10,
              );
        }

        /// Disabled
        if (states.contains(WidgetState.disabled)) {
          return widget.svg != null
              ? textTheme.bodySmall
              : textTheme.labelLarge?.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: ScaleColorConfig.neutral40,
              );
        }

        /// Enabled
        return widget.svg != null
            ? textTheme.bodySmall
            : textTheme.labelLarge?.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: ScaleColorConfig.secondary30,
            );
      });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: !widget.disabled ? widget.onPressed : null,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        minimumSize: Size.zero,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: 0,
      ).copyWith(
        foregroundColor: _foregroundColor,
        backgroundColor: _backgroundColor,
        textStyle: _textStyle,
        overlayColor:
            widget.svg != null
                ? null
                : WidgetStateProperty.all(Colors.transparent),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (widget.svg != null) ...<Widget>[
            SvgPicture.asset(
              widget.svg!.path,
              colorFilter:
                  !widget.disabled
                      ? const ColorFilter.mode(
                        ScaleColorConfig.primary60,
                        BlendMode.srcIn,
                      )
                      : const ColorFilter.mode(
                        ScaleColorConfig.neutral50,
                        BlendMode.srcIn,
                      ),
              width: 16,
            ),
            const SizedBox(width: 10),
          ],
          Text(widget.label, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
