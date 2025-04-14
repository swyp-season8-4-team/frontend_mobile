import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/tag/label_tag.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/domain/model/mate/mate_detail_model.dart';

class DessertListHeader extends StatelessWidget {
  const DessertListHeader({required this.mate, super.key});

  final MateDetailModel mate;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            CustomLabelTag(
              label: mate.mateCategory,
              backgroundColor: ScaleColorConfig.success80,
              color: ScaleColorConfig.success10,
            ),
            const SizedBox(width: 4),
            mate.recruitYn
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
              width: 12,
              colorFilter: const ColorFilter.mode(
                ScaleColorConfig.neutral40,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              '2 / 5',
              style: textTheme.labelMedium?.copyWith(
                color: ScaleColorConfig.neutral40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
