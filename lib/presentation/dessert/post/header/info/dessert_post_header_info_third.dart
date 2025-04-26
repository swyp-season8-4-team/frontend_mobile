import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_size.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';

class DessertPostHeaderInfoThird extends StatelessWidget {
  const DessertPostHeaderInfoThird({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: <Widget>[
        CustomProfilePhotoSize.boy(size: CustomProfilePhotoSizeEnum.s),
        const SizedBox(width: 8),
        Text(
          '찌삐사우르스',
          style: textTheme.labelLarge?.copyWith(
            color: ScaleColorConfig.neutral30,
          ),
        ),
      ],
    );
  }
}
