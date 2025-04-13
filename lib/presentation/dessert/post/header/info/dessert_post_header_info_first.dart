import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/tag/label_tag.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

class DessertPostHeaderInfoFirst extends StatelessWidget {
  const DessertPostHeaderInfoFirst({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Row(
          children: <Widget>[
            CustomLabelTag(
              label: '친목도모',
              backgroundColor: ScaleColorConfig.success80,
              color: ScaleColorConfig.success10,
            ),
            SizedBox(width: 4),
            CustomLabelTag(
              label: '친목도모',
              backgroundColor: ScaleColorConfig.error90,
              color: ScaleColorConfig.error20,
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
              '3 / 5',
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
