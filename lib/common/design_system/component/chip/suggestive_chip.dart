import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/chip/custom_chip.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';

class CustomSuggestiveChip extends StatelessWidget {
  const CustomSuggestiveChip({
    required this.label,
    required this.onPressed,
    required this.isSelected,
    this.labelColor,
    this.number,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isSelected;
  final Color? labelColor;
  final int? number;

  WidgetStateProperty<Color?> get _color =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Pressed
        if (states.contains(WidgetState.pressed)) {
          return ScaleColorConfig.surface80;
        }

        /// Selected
        if (isSelected) {
          return ScaleColorConfig.primary90;
        }

        return ScaleColorConfig.primary100;
      });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return CustomChip(
      color: _color,
      label: label,
      labelColor: labelColor,
      onPressed: onPressed,
      side: BorderSide(
        color:
            !isSelected
                ? ScaleColorConfig.neutral50
                : ScaleColorConfig.primary70,
      ),
      trailing:
          number != null
              ? Text(
                number! >= 1000 ? '999+' : number.toString(),
                style: textTheme.labelMedium?.copyWith(
                  color: ScaleColorConfig.success40,
                ),
              )
              : null,
    );
  }
}
