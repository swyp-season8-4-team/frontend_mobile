import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/domain/model/mate/mate_detail_model.dart';

class DessertListBody extends StatelessWidget {
  const DessertListBody({required this.mate, super.key});

  final MateDetailModel mate;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          mate.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: textTheme.titleSmall?.copyWith(
            /// TODO: 컬러 정의되면 바꾸기
            color: const Color(0xFF393939),
          ),
        ),
        const SizedBox(height: 4),

        if (mate.place?.address != null)
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
                mate.place!.address.toString(),
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
