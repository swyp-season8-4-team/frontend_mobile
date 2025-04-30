import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';

/// 리뷰 유의사항
class ReviewNote extends StatelessWidget {
  const ReviewNote({required this.note, super.key});
  final String note;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          ' · ',
          style: textTheme.labelSmall?.copyWith(
            color: ScaleColorConfig.neutral40,
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            note,
            style: textTheme.labelSmall?.copyWith(
              color: ScaleColorConfig.neutral40,
            ),
          ),
        ),
      ],
    );
  }
}
