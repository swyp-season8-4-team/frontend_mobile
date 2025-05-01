import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/tag/label_tag.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/presentation/dessert/post/dessert_post_view_model.dart';

class DessertPostHeaderInfoFirst extends ConsumerWidget {
  const DessertPostHeaderInfoFirst({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DessertPostState state = ref.watch(dessertPostViewModelProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            CustomLabelTag(
              label: state.data.mateCategory,
              backgroundColor: ScaleColorConfig.success80,
              color: ScaleColorConfig.success10,
            ),
            const SizedBox(width: 4),
            state.data.recruitYn
                ? const CustomLabelTag(
                  label: '모집중',
                  backgroundColor: ScaleColorConfig.error90,
                  color: ScaleColorConfig.error20,
                )
                : const CustomLabelTag(
                  label: '모집마감',
                  backgroundColor: ScaleColorConfig.neutral70,
                  color: ScaleColorConfig.neutral30,
                ),
          ],
        ),

        Row(
          children: <Widget>[
            Assets.icon.user.group1Line.svg(
              width: 14,
              colorFilter: const ColorFilter.mode(
                ScaleColorConfig.neutral40,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              '${state.data.currentMemberCount} / ${state.data.capacity}',
              style: textTheme.labelLarge?.copyWith(
                color: ScaleColorConfig.neutral40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
