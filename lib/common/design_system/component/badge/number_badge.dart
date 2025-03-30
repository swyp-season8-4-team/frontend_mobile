import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';

class CustomNumberBadge extends StatelessWidget {
  const CustomNumberBadge({required this.number, super.key});

  final int number;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        color: ScaleColorConfig.error90,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      child: Text(
        number >= 1000 ? '999+' : number.toString(),
        style: textTheme.labelSmall?.copyWith(
          height: 1,
          color: ScaleColorConfig.error10,
        ),
      ),
    );
  }
}
