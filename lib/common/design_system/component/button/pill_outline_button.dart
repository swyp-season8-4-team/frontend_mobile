import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

class CustomPillOutlineButton extends StatefulWidget {
  const CustomPillOutlineButton({
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

  @override
  State<CustomPillOutlineButton> createState() =>
      _CustomPillOutlineButtonState();
}

class _CustomPillOutlineButtonState extends State<CustomPillOutlineButton> {
  bool _isSelected = false;

  WidgetStateProperty<Color?> get _foregroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          return ScaleColorConfig.primary20;
        }

        /// Selected
        if (_isSelected) {
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
        if (_isSelected) {
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
          return BorderSide(color: ScaleColorConfig.neutral50);
        }

        /// Selected
        if (_isSelected) {
          return BorderSide(color: ScaleColorConfig.primary70);
        }

        /// Disabled
        if (states.contains(WidgetState.disabled)) {
          return BorderSide(color: ScaleColorConfig.neutral70);
        }

        /// Enabled
        return BorderSide(color: ScaleColorConfig.neutral50);
      });

  void _onPressed() {
    if (widget.onPressed != null) {
      widget.onPressed!();
    }

    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: 159,
      child: OutlinedButton(
        onPressed: !widget.disabled ? _onPressed : null,
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
            if (widget.svg != null) ...<Widget>[
              SvgPicture.asset(
                widget.svg!.path,
                colorFilter:
                    !widget.disabled
                        ? null
                        : ColorFilter.mode(
                          ScaleColorConfig.neutral50,
                          BlendMode.srcIn,
                        ),
              ),
              const SizedBox(width: 10),
            ],
            Expanded(child: Text(widget.label, textAlign: TextAlign.center)),
          ],
        ),
      ),
    );
  }
}
