import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/outline_button.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_size.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/domain/model/mate_member/mate_member_detail_model.dart';
import 'package:frontend_mobile/presentation/dessert/post/dessert_post_view_model.dart';

class DessertPostHostApproved extends ConsumerWidget {
  const DessertPostHostApproved({super.key});

  Widget _pendingListProfileImage({required MateMemberDetailModel item}) {
    if (item.profileImage.isNotEmpty) {
      return Container(
        width: 32,
        height: 32,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: CachedNetworkImage(
          imageUrl: item.profileImage,
          fit: BoxFit.cover,
        ),
      );
    }

    return item.gender == 'MALE'
        ? CustomProfilePhotoSize.boy(size: CustomProfilePhotoSizeEnum.m)
        : CustomProfilePhotoSize.girl(size: CustomProfilePhotoSizeEnum.m);
  }

  Widget _pendingListItem({required MateMemberDetailModel item}) {
    return Row(
      children: <Widget>[
        _pendingListProfileImage(item: item),
        const SizedBox(width: 6),
        Text(item.nickname),

        const Spacer(),

        CustomFillButton.xSmall(label: '수락', width: 55, onPressed: () {}),
        const SizedBox(width: 6),
        CustomOutlineButton.xSmall(label: '거절', width: 55, onPressed: () {}),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DessertPostState state = ref.watch(dessertPostViewModelProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: <Widget>[
        Container(height: 16, color: const Color.fromRGBO(242, 241, 237, 1)),
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    '참여멤버',
                    style: textTheme.titleSmall?.copyWith(
                      color: ScaleColorConfig.neutral20,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    state.pendingData.length.toString(),
                    style: textTheme.titleSmall?.copyWith(
                      color: ScaleColorConfig.success50,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              ...List<Widget>.generate(state.pendingData.length, (int index) {
                final MateMemberDetailModel item = state.pendingData[index];

                return Column(
                  children: <Widget>[
                    _pendingListItem(item: item),

                    if (index != state.pendingData.length - 1)
                      const SizedBox(height: 10),
                  ],
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
