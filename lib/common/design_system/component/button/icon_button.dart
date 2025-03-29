import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

class CustomIconButton extends StatefulWidget {
  const CustomIconButton({
    required this.onPressed,
    required this.svg,
    this.disabled = false,
    super.key,
  });

  final VoidCallback? onPressed;
  final SvgGenImage svg;
  final bool disabled;

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  Color _iconColor = ScaleColorConfig.black;
  bool _isSelected = false;

  WidgetStateProperty<Color?>? get _foregroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          /// Presssed
          if (states.contains(WidgetState.pressed)) {
            setState(() {
              _iconColor = ScaleColorConfig.neutral40;
            });
            return;
          }

          /// Selected
          if (_isSelected) {
            setState(() {
              _iconColor = ScaleColorConfig.primary20;
            });
            return;
          }

          /// Disabled
          if (states.contains(WidgetState.disabled)) {
            setState(() {
              _iconColor = ScaleColorConfig.neutral40;
            });
            return;
          }

          /// Enabled
          setState(() {
            _iconColor = ScaleColorConfig.neutral40;
          });
        });

        return null;
      });

  WidgetStateProperty<Color?>? get _backgroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          return ScaleColorConfig.neutral60;
        }

        /// Selected
        if (_isSelected) {
          return ScaleColorConfig.primary80;
        }

        /// Disabled
        if (states.contains(WidgetState.disabled)) {
          return ScaleColorConfig.neutral50;
        }

        /// Enabled
        return ScaleColorConfig.neutral90;
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
    // TODO: Shadow 정의되면 적용해야 함
    return IconButton(
      onPressed: !widget.disabled ? _onPressed : null,
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
        minimumSize: Size.zero,
        padding: const EdgeInsets.all(4),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: 0,
      ).copyWith(
        foregroundColor: _foregroundColor,
        backgroundColor: _backgroundColor,
      ),
      icon: SvgPicture.asset(
        widget.svg.path,
        colorFilter: ColorFilter.mode(_iconColor, BlendMode.srcIn),
      ),
      // icon: const Icon(Icons.abc),
    );
  }
}
