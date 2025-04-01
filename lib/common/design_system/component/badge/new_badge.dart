import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';

class CustomNewBadge extends StatelessWidget {
  const CustomNewBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      width: 16,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: ScaleColorConfig.error40,
      ),
      child: Align(
        child: Text(
          'N',
          style: textTheme.labelSmall?.copyWith(
            color: ScaleColorConfig.primary100,
          ),
        ),
      ),
    );
  }
}
