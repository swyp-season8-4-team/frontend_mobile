import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/bottom_sheet/bottom_sheet.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

void tasteSkipBottomSheet({
  required BuildContext context,
  required TextTheme textTheme,
}) {
  CustomBottomSheet.middle(
    context: context,
    child: Column(
      children: <Widget>[
        Text(
          '정말 건너뛰실 건가요?',
          style: textTheme.titleLarge?.copyWith(
            color: ScaleColorConfig.primary5,
          ),
        ),
        const SizedBox(height: 8),

        Text(
          '언제든 MY 페이지에서 설정할 수 있어요',
          style: textTheme.bodyMedium?.copyWith(
            color: ScaleColorConfig.neutral30,
          ),
        ),
        const SizedBox(height: 16),

        Assets.image.flowerBee1.image(),
      ],
    ),
    leftButton: BottomSheetButton(label: '취소', onPressed: () => context.pop()),

    rightButton: BottomSheetButton(
      label: '건너뛰기',
      onPressed: () {
        context.goNamed(AppRoutes.map.name);
      },
    ),
  );
}
