import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';

class DessertListFooter extends StatelessWidget {
  const DessertListFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            /// TODO: profile_photo 컴포넌트 적용하기
            Container(width: 16, height: 16, color: const Color(0xFFDFDFDF)),
            const SizedBox(width: 4),
            Text(
              '찌삐사우르스',
              style: textTheme.labelLarge?.copyWith(
                color: ScaleColorConfig.neutral30,
              ),
            ),
          ],
        ),
        Text(
          '2025.01.28',
          style: textTheme.labelLarge?.copyWith(
            color: ScaleColorConfig.neutral50,
          ),
        ),
      ],
    );
  }
}
