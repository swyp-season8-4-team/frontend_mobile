import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/button/text_button.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';

class DessertPostHeaderLocation extends StatelessWidget {
  const DessertPostHeaderLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              '장소',
              style: textTheme.titleSmall?.copyWith(
                color: ScaleColorConfig.neutral40,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '망원 베이커리',
              style: textTheme.bodyMedium?.copyWith(
                color: ScaleColorConfig.neutral20,
              ),
            ),
          ],
        ),

        CustomTextButton.underline(label: '지도에서 위치보기', onPressed: () {}),
      ],
    );
  }
}
