import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

class DessertListBody extends StatelessWidget {
  const DessertListBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: <Widget>[
        Text(
          '망원동 카페이서 디저트 먹으며 수다 떨 사람 구함 망원동 카페이서 디저트 먹으며 수다 떨 사람 구함',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: textTheme.titleSmall?.copyWith(
            /// TODO: 컬러 정의되면 바꾸기
            color: const Color(0xFF393939),
          ),
        ),
        const SizedBox(height: 4),

        Row(
          children: <Widget>[
            Assets.icon.map.locationLine.svg(
              width: 12,
              colorFilter: const ColorFilter.mode(
                ScaleColorConfig.neutral40,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              '마포구',
              style: textTheme.bodySmall?.copyWith(
                color: ScaleColorConfig.neutral40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
