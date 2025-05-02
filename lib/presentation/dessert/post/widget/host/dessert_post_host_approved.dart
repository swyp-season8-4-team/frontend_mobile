import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/outline_button.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_size.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/domain/model/mate_member/mate_member_detail_model.dart';
import 'package:frontend_mobile/domain/param/mate_member/ban_mate_member_params.dart';
import 'package:frontend_mobile/presentation/dessert/post/dessert_post_view_model.dart';
import 'package:go_router/go_router.dart';

class DessertPostHostApproved extends ConsumerStatefulWidget {
  const DessertPostHostApproved({super.key});

  @override
  ConsumerState<DessertPostHostApproved> createState() =>
      _DessertPostHostApprovedState();
}

class _DessertPostHostApprovedState
    extends ConsumerState<DessertPostHostApproved> {
  Widget _approvedListProfileImage({required MateMemberDetailModel item}) {
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

  Widget _approvedListItem({required MateMemberDetailModel item}) {
    final DessertPostState state = ref.watch(dessertPostViewModelProvider);

    return Row(
      children: <Widget>[
        _approvedListProfileImage(item: item),
        const SizedBox(width: 6),
        Text(item.nickname),

        const Spacer(),

        CustomOutlineButton.xSmall(
          label: '강퇴',
          width: 55,
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomDialog.basic(
                  title: '강제퇴장',
                  description: '${item.nickname} 님을\n강퇴하시겠습니까?',
                  primaryButton: CustomDialogButton(
                    text: '강제퇴장',
                    warning: true,
                    onTap: () {
                      ref
                          .read(dessertPostViewModelProvider.notifier)
                          .banMateMember(
                            params: BanMateMemberParams(
                              mateUuid: state.data.mateUuid,
                              creatorUserUuid: state.data.userUuid,
                              banUserUuid: item.userUuid,
                            ),
                          );
                      context.pop();
                    },
                  ),
                  secondaryButton: CustomDialogButton(
                    text: '취소',
                    onTap: () {
                      context.pop();
                    },
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    state.memberData.length.toString(),
                    style: textTheme.titleSmall?.copyWith(
                      color:
                          state.memberData.isEmpty
                              ? ScaleColorConfig.neutral40
                              : ScaleColorConfig.success50,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              if (state.memberData.isEmpty)
                SizedBox(
                  height: 116,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      '아직 참여한 멤버가 없어요',
                      style: textTheme.labelLarge?.copyWith(
                        color: ScaleColorConfig.neutral50,
                      ),
                    ),
                  ),
                )
              else
                ...List<Widget>.generate(state.memberData.length, (int index) {
                  final MateMemberDetailModel item = state.memberData[index];

                  return Column(
                    children: <Widget>[
                      _approvedListItem(item: item),

                      if (index != state.memberData.length - 1)
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
