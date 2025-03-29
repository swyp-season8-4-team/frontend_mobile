import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return RawChip(
      color: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
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
      }),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: ScaleColorConfig.neutral50),
      ),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(widget.label),
          const SizedBox(width: 4),
          SvgPicture.asset(
            Assets.icon.system.closeCircleFill.path,
            width: 16,
            colorFilter: ColorFilter.mode(_iconColor, BlendMode.srcIn),
          ),
        ],
      ),
      labelStyle: textTheme.labelLarge?.copyWith(
        color: ScaleColorConfig.primary20,
      ),
      onPressed: widget.onPressed,
      visualDensity: const VisualDensity(vertical: -4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      labelPadding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
