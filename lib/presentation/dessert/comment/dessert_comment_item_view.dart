import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/etc/option_menu_dropdown.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/domain/model/mate_reply/mate_reply_detail_model.dart';
import 'package:frontend_mobile/domain/param/user/block_user_params.dart';
import 'package:frontend_mobile/presentation/dessert/post/dessert_post_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

class DessertCommentItemView extends ConsumerStatefulWidget {
  const DessertCommentItemView({
    required this.item,
    required this.mateUuid,
    super.key,
  });

  final MateReplyDetailModel item;
  final String mateUuid;

  @override
  ConsumerState<DessertCommentItemView> createState() =>
      _DessertCommentItemViewState();
}

class _DessertCommentItemViewState
    extends ConsumerState<DessertCommentItemView> {
  bool isOptionActive = false;

  void _optionHandler() {
    setState(() {
      isOptionActive = !isOptionActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PortalTarget(
      portalFollower: Container(
        margin: const EdgeInsets.only(top: 8),
        child: CustomOptionMenuDropdown(
          optionMenus: <CustomOptionMenu>[
            CustomOptionMenu(
              text: '신고하기',
              onTap: () {
                _optionHandler();
                context.pushNamed(
                  AppRoutes.dessertCommentReport.name,
                  extra: <String, dynamic>{
                    'mateUuid': widget.mateUuid,
                    'item': widget.item,
                  },
                );
              },
            ),
            CustomOptionMenu(
              text: '차단하기',
              onTap: () {
                _optionHandler();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialog.basic(
                      title: '${widget.item.nickname}님을 차단하시겠어요?',
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
                                  blockedUserUuid: widget.item.userUuid,
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
        onTap: _optionHandler,
        child: Assets.icon.menu.more2Fill.svg(
          colorFilter: const ColorFilter.mode(
            ScaleColorConfig.neutral40,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
