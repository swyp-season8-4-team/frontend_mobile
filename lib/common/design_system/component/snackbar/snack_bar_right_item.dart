import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/manager/toast/toast_manager.dart';

class SnackBarCloseButton extends ConsumerWidget {
  const SnackBarCloseButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: GestureDetector(
        onTap: () {
          ref.read(toastManagerProvider).remove();
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
