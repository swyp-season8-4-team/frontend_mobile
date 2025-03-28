import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

class SnackBarCloseButton extends StatelessWidget {
  const SnackBarCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
        child: Assets.icon.system.closeLine.svg(
          colorFilter: ColorFilter.mode(
            ScaleColorConfig.neutral80,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

class SnackBarActionButton extends StatelessWidget {
  const SnackBarActionButton({
    required this.onTap,
    super.key,
    this.label = 'Action',
  });

  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          label,
          style: textTheme.titleSmall?.copyWith(
            color: ScaleColorConfig.primary80,
          ),
        ),
      ),
    );
  }
}
