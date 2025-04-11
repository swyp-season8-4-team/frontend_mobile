import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/chip/custom_chip.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/design_system/foundation/shadow/shadow_config.dart';

class CustomFloatingChip extends StatefulWidget {
  const CustomFloatingChip({
    required this.label,
    required this.onPressed,
    this.selected = false,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool selected;

  @override
  State<CustomFloatingChip> createState() => _CustomFloatingChipState();
}

class _CustomFloatingChipState extends State<CustomFloatingChip> {
  WidgetStateProperty<Color?> get _color =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Pressed
        if (states.contains(WidgetState.pressed)) {
          return ScaleColorConfig.surface80;
        }

        /// Selected
        if (widget.selected) {
          return ScaleColorConfig.primary90;
        }

        return ScaleColorConfig.primary100;
      });

  void _onPressed() {
    if (widget.onPressed != null) {
      widget.onPressed!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow:
            !widget.selected ? ShadowConfig().level1 : ShadowConfig().level2,
        borderRadius: BorderRadius.circular(24),
      ),
      child: CustomChip(
        color: _color,
        label: widget.label,
        onPressed: _onPressed,
        side: BorderSide(
          color:
              !widget.selected
                  ? ScaleColorConfig.neutral50
                  : ScaleColorConfig.primary70,
        ),
      ),
    );
  }
}
