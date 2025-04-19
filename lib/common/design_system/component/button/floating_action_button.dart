import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/design_system/foundation/shadow/shadow_config.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    required this.onPressed,
    required this.svg,
    this.disabled = false,

    super.key,
  });

  final VoidCallback? onPressed;
  final SvgPicture svg;
  final bool disabled;

  WidgetStateProperty<Color?> get _backgroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          return ScaleColorConfig.primary5;
        }

        /// Disabled
        if (states.contains(WidgetState.disabled)) {
          return ScaleColorConfig.neutral60;
        }

        /// Enabled
        return ScaleColorConfig.neutral20;
      });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        boxShadow: ShadowConfig().level2,
        borderRadius: BorderRadius.circular(12),
      ),
      child: FilledButton(
        onPressed: !disabled ? onPressed : null,
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          minimumSize: Size.zero,
          padding: const EdgeInsets.all(8),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          elevation: 0,
          textStyle: textTheme.titleMedium,
        ).copyWith(backgroundColor: _backgroundColor),
        child: svg,
      ),
    );
  }
}
