import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/chip/custom_chip.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';

class CustomSuggestiveChip extends StatefulWidget {
  const CustomSuggestiveChip({
    required this.label,
    required this.onPressed,
    this.number,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final int? number;

  @override
  State<CustomSuggestiveChip> createState() => _CustomSuggestiveChipState();
}

class _CustomSuggestiveChipState extends State<CustomSuggestiveChip> {
  bool _isSelected = false;

  WidgetStateProperty<Color?> get _color =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Pressed
        if (states.contains(WidgetState.pressed)) {
          return ScaleColorConfig.surface80;
        }

        /// Selected
        if (_isSelected) {
          return ScaleColorConfig.primary90;
        }

        return ScaleColorConfig.primary100;
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

    return CustomChip(
      color: _color,
      label: widget.label,
      onPressed: _onPressed,
      side: BorderSide(
        color:
            !_isSelected
                ? ScaleColorConfig.neutral50
                : ScaleColorConfig.primary70,
      ),
      trailing:
          widget.number != null
              ? Text(
                widget.number! >= 1000 ? '999+' : widget.number.toString(),
                style: textTheme.labelMedium?.copyWith(
                  color: ScaleColorConfig.success40,
                ),
              )
              : null,
    );
  }
}
