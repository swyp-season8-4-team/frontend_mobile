import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_mobile/common/design_system/component/chip/custom_chip.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

class CustomInputChip extends StatefulWidget {
  const CustomInputChip({
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  State<CustomInputChip> createState() => _CustomInputChipState();
}

class _CustomInputChipState extends State<CustomInputChip> {
  Color _iconColor = ScaleColorConfig.neutral50;

  WidgetStateProperty<Color?> get _color =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          /// Pressed
          if (states.contains(WidgetState.pressed)) {
            setState(() {
              _iconColor = ScaleColorConfig.neutral30;
            });
            return;
          }

          /// Enabled
          setState(() {
            _iconColor = ScaleColorConfig.neutral50;
          });
        });

        return ScaleColorConfig.primary100;
      });

  @override
  Widget build(BuildContext context) {
    return CustomChip(
      color: _color,
      label: widget.label,
      onPressed: widget.onPressed,
      side: const BorderSide(color: ScaleColorConfig.neutral50),
      trailing: SvgPicture.asset(
        Assets.icon.system.closeCircleFill.path,
        width: 16,
        colorFilter: ColorFilter.mode(_iconColor, BlendMode.srcIn),
      ),
    );
  }
}
