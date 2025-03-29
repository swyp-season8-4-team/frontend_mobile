import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';

class CustomSuggestiveChip extends StatefulWidget {
  const CustomSuggestiveChip({
    required this.label,
    required this.onPressed,
    required this.number,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final int number;

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

    return RawChip(
      color: _color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color:
              !_isSelected
                  ? ScaleColorConfig.neutral50
                  : ScaleColorConfig.primary70,
        ),
      ),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(widget.label),
          const SizedBox(width: 4),
          Text(
            widget.number >= 1000 ? '999+' : widget.number.toString(),
            style: textTheme.labelMedium?.copyWith(
              color: ScaleColorConfig.success40,
            ),
          ),
        ],
      ),
      labelStyle: textTheme.labelLarge?.copyWith(
        color: ScaleColorConfig.primary20,
      ),
      onPressed: _onPressed,
      visualDensity: const VisualDensity(vertical: -4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      labelPadding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
