import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

class SnackBarCloseButton extends StatelessWidget {
  const SnackBarCloseButton({required this.onTap, super.key});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
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
    this.label = 'Action',
    super.key,
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
