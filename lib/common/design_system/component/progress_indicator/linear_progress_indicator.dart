import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';

/// Linear Progress Indicator
/// https://www.figma.com/design/Cmw8GLJYfuUVf9A3QNxqgW/SWYP_%EC%95%B1_1%EA%B8%B0_%EB%94%94%EC%A0%80%EB%B9%84?node-id=404-39628&t=5o43YjWL0f9qsQKt-4
class CustomLinearProgressIndicator extends StatelessWidget {
  const CustomLinearProgressIndicator({
    required this.currentValue,
    required this.maxValue,
    super.key,
  });
  final double currentValue;
  final double maxValue;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          width: size.width,
          height: 7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99),
            color: ScaleColorConfig.surface70,
          ),
          alignment: Alignment.centerLeft,
          child: Container(
            // currentValue / maxValue로 나오는 값이 0이상 1이하임을 보장
            width: max(min((currentValue / maxValue), 1.0), 0) * size.width,
            height: 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              color: ScaleColorConfig.primary70,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '${currentValue.toInt()}/${maxValue.toInt()}',
          style: TextStyle(
            fontSize: 14,
            height: 20 / 14,
            color: ScaleColorConfig.neutral40,
            letterSpacing: -0.32,
          ),
        ),
      ],
    );
  }
}
