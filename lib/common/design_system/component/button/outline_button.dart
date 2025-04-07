import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    required this.label,
    required this.onPressed,
    this.svg,
    this.width,
    this.disabled = false,
    this.large = true,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final SvgGenImage? svg;
  final double? width;
  final bool disabled;

  /// 사이즈를 구분할 때 사용하는 변수
  /// large, small 있음
  final bool large;

  WidgetStateProperty<Color?> get _foregroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Presssed
        if (states.contains(WidgetState.pressed)) {
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

        /// Disabled
        if (states.contains(WidgetState.disabled)) {
          return const BorderSide(color: ScaleColorConfig.neutral70);
        }

        /// Enabled
        return const BorderSide(color: ScaleColorConfig.neutral50);
      });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: width,
      child: OutlinedButton(
        onPressed: !disabled ? onPressed : null,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          minimumSize: Size.zero,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          elevation: 0,
          textStyle: large ? textTheme.titleMedium : textTheme.titleSmall,
        ).copyWith(
          foregroundColor: _foregroundColor,
          backgroundColor: _backgroundColor,
          side: _side,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (svg != null) ...<Widget>[
              SvgPicture.asset(
                svg!.path,
                width: large ? null : 18,
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

            if (width != null)
              Expanded(child: Text(label, textAlign: TextAlign.center))
            else
              Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
