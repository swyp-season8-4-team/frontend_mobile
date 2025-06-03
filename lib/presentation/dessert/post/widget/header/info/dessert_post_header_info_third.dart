import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/etc/option_menu_dropdown.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_size.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/domain/param/user/block_user_params.dart';
import 'package:frontend_mobile/presentation/dessert/post/dessert_post_view_model.dart';
import 'package:frontend_mobile/presentation/global/user/user_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

class DessertPostHeaderInfoThird extends ConsumerWidget {
  const DessertPostHeaderInfoThird({
    required this.isOptionActive,
    required this.optionHandler,
    super.key,
  });

  final bool isOptionActive;
  final VoidCallback optionHandler;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DessertPostState state = ref.watch(dessertPostViewModelProvider);
    final UserState userstate = ref.read(userViewModelProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
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
                  ? CustomProfilePhotoSize.boy(
                    size: CustomProfilePhotoSizeEnum.s,
                  )
                  : CustomProfilePhotoSize.girl(
                    size: CustomProfilePhotoSizeEnum.s,
                  ),
            const SizedBox(width: 8),
            Text(
              state.data.nickname,
              style: textTheme.labelLarge?.copyWith(
                color: ScaleColorConfig.neutral30,
              ),
            ),
          ],
        ),
        PortalTarget(
          portalFollower: Container(
            margin: const EdgeInsets.only(top: 8),
            child: CustomOptionMenuDropdown(
              optionMenus: <CustomOptionMenu>[
                CustomOptionMenu(
                  text: '신고하기',
                  onTap: () {
                    optionHandler();
                    context.pushNamed(AppRoutes.dessertPostReport.name);
                  },
                ),
                CustomOptionMenu(
                  text: '차단하기',
                  onTap: () {
                    optionHandler();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialog.basic(
                          title: '${state.data.nickname}님을 차단하시겠어요?',
                          description:
                              '차단하면 상대방이 진행하는 디저비 활동 정보를 모두 볼 수 없어요.\n추후 [My > 설정 > 차단 멤버 관리하기]에서 언제든지 해제할 수 있어요',
                          secondaryButton: CustomDialogButton(
                            text: '아니오',
                            onTap: () => context.pop(),
                          ),
                          primaryButton: CustomDialogButton(
                            warning: true,
                            text: '네, 차단할래요',
                            onTap: () {
                              ref
                                  .read(dessertPostViewModelProvider.notifier)
                                  .postBlockUser(
                                    params: BlockUserParams(
                                      blockedUserUuid: state.data.userUuid,
                                    ),
                                  );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          anchor: const Aligned(
            follower: Alignment.topRight,
            target: Alignment.bottomRight,
          ),
          visible: isOptionActive,
          child: GestureDetector(
            onTap: optionHandler,
            child: Assets.icon.menu.more2Fill.svg(
              colorFilter: const ColorFilter.mode(
                ScaleColorConfig.neutral40,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
