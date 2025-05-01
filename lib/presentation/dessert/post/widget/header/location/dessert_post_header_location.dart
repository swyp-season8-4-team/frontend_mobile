import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/presentation/dessert/post/dessert_post_view_model.dart';

class DessertPostHeaderLocation extends ConsumerWidget {
  const DessertPostHeaderLocation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DessertPostState state = ref.watch(dessertPostViewModelProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;

    if (state.data.place?.placeName == null) {
      return const SizedBox.shrink();
    }

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
              state.data.place!.placeName.toString(),
              style: textTheme.bodyMedium?.copyWith(
                color: ScaleColorConfig.neutral20,
              ),
            ),
          ],
        ),

        // CustomTextButton.underline(label: '지도에서 위치보기', onPressed: () {}),
      ],
    );
  }
}
