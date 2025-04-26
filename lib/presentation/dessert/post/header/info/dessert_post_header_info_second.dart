import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';

class DessertPostHeaderInfoSecond extends StatelessWidget {
  const DessertPostHeaderInfoSecond({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Text(
      '망원동 빵지순례 같이 가실 분 모집!',
      style: textTheme.titleMedium?.copyWith(color: ScaleColorConfig.neutral20),
    );
  }
}
