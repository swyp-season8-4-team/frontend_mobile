import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.label,
    required this.onPressed,
    this.disabled = false,
    this.svg,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool disabled;
  final SvgGenImage? svg;

  WidgetStateProperty<Color?> get _foregroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          return svg != null
              ? ScaleColorConfig.primary60
              : ScaleColorConfig.secondary10;
        }

        /// Disabled
        if (states.contains(WidgetState.disabled)) {
          return svg != null ? ScaleColorConfig.neutral50 : null;
        }

        /// Enabled
        return svg != null
            ? ScaleColorConfig.primary60
            : ScaleColorConfig.secondary30;
      });

  WidgetStateProperty<Color?> get _backgroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          return svg != null ? ScaleColorConfig.surface80 : Colors.transparent;
        }

        /// Disabled
        if (states.contains(WidgetState.disabled)) {
          return svg != null ? Colors.transparent : null;
        }

        /// Enabled
        return Colors.transparent;
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
        textStyle:
            svg != null
                ? textTheme.bodyLarge
                : textTheme.labelLarge?.copyWith(
                  decoration: TextDecoration.underline,
                ),
      ).copyWith(
        foregroundColor: _foregroundColor,
        backgroundColor: _backgroundColor,
        overlayColor:
            svg != null ? null : WidgetStateProperty.all(Colors.transparent),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (svg != null) ...<Widget>[
            SvgPicture.asset(
              svg!.path,
              colorFilter:
                  !disabled
                      ? ColorFilter.mode(
                        ScaleColorConfig.primary60,
                        BlendMode.srcIn,
                      )
                      : ColorFilter.mode(
                        ScaleColorConfig.neutral50,
                        BlendMode.srcIn,
                      ),
              width: 16,
            ),
            const SizedBox(width: 10),
          ],
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
