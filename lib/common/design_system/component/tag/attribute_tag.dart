import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

class CustomAttributeTag extends StatefulWidget {
  const CustomAttributeTag({
    required this.label,
    required this.onTap,
    this.selected = false,
    super.key,
  });
  final String label;
  final VoidCallback onTap;
  final bool selected;

  @override
  State<CustomAttributeTag> createState() => _CustomAttributeTagState();
}

class _CustomAttributeTagState extends State<CustomAttributeTag> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: widget.onTap,
      onTapDown: (_) => _setPressed(),
      onTapUp: (_) => _unsetPressed(),
      onTapCancel: _unsetPressed,
      child: Container(
        padding: _getPadding(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: _getBorderColor()),
          color: _getBackgroundColor(),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              widget.label,
              style: textTheme.labelLarge?.copyWith(
                color: ScaleColorConfig.primary20,
              ),
            ),
            if (widget.selected)
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Assets.icon.etc.a16CloseFilled1.svg(),
              ),
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    if (widget.selected) {
      return ScaleColorConfig.primary90;
    } else if (_pressed) {
      return ScaleColorConfig.surface80;
    } else {
      return ScaleColorConfig.surface90;
    }
  }

  Color _getBorderColor() {
    final ColorScheme colorShceme = Theme.of(context).colorScheme;
    if (widget.selected) {
      return ScaleColorConfig.primary70;
    }

    return colorShceme.outline;
  }

  EdgeInsets _getPadding() {
    if (widget.selected) {
      return const EdgeInsets.symmetric(horizontal: 8, vertical: 6);
    }

    return const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
  }

  void _setPressed() {
    setState(() {
      _pressed = true;
    });
  }

  void _unsetPressed() {
    setState(() {
      _pressed = false;
    });
  }
}
