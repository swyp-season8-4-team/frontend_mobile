import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_size.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/presentation/dessert/post/dessert_post_view_model.dart';

class DessertPostHeaderInfoThird extends ConsumerWidget {
  const DessertPostHeaderInfoThird({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DessertPostState state = ref.watch(dessertPostViewModelProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: <Widget>[
        if (state.data.profileImage.isNotEmpty)
          Container(
            width: 24,
            height: 24,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(shape: BoxShape.circle),

            child: CachedNetworkImage(
              imageUrl: state.data.profileImage,
              fit: BoxFit.cover,
            ),
          )
        else
          state.data.gender == 'MALE'
              ? CustomProfilePhotoSize.boy(size: CustomProfilePhotoSizeEnum.s)
              : CustomProfilePhotoSize.girl(size: CustomProfilePhotoSizeEnum.s),
        const SizedBox(width: 8),
        Text(
          state.data.nickname,
          style: textTheme.labelLarge?.copyWith(
            color: ScaleColorConfig.neutral30,
          ),
        ),
      ],
    );
  }
}
