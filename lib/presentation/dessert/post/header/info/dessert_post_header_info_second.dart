import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/presentation/dessert/post/dessert_post_view_model.dart';

class DessertPostHeaderInfoSecond extends ConsumerWidget {
  const DessertPostHeaderInfoSecond({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DessertPostState state = ref.watch(dessertPostViewModelProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Text(
      state.data.title,
      style: textTheme.titleMedium?.copyWith(color: ScaleColorConfig.neutral20),
    );
  }
}
