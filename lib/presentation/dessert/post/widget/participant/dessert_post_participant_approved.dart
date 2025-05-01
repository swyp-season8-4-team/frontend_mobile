import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/outline_button.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/domain/param/mate_member/leave_mate_member_params.dart';
import 'package:frontend_mobile/presentation/dessert/comment/dessert_comment_view.dart';
import 'package:frontend_mobile/presentation/dessert/post/dessert_post_view_model.dart';
import 'package:frontend_mobile/presentation/global/user/user_view_model.dart';
import 'package:go_router/go_router.dart';

class DessertPostParticipantApproved extends ConsumerWidget {
  const DessertPostParticipantApproved({required this.mateUuid, super.key});

  final String mateUuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DessertPostState state = ref.watch(dessertPostViewModelProvider);
    final UserState userState = ref.read(userViewModelProvider);

    return Column(
      children: <Widget>[
        Container(height: 16, color: const Color.fromRGBO(242, 241, 237, 1)),
        DessertComment(mateUuid: mateUuid),

        /// 모임장이 아니면 모임 나가기 버튼 활성화
        if (userState.data.userUuid != state.data.userUuid)
          Column(
            children: <Widget>[
              Container(
                height: 16,
                color: const Color.fromRGBO(242, 241, 237, 1),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomOutlineButton.medium(
                    svg: Assets.icon.system.exitLine,
                    label: '모임 나가기',
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomDialog.basic(
                            title: '정말 모임을 나가시겠어요?',
                            description: '모임을 나가시면 더 이상\n활동에 참여할 수 없어요.',
                            primaryButton: CustomDialogButton(
                              text: '나가기',
                              onTap: () {
                                ref
                                    .read(dessertPostViewModelProvider.notifier)
                                    .leaveMateMember(
                                      params: LeaveMateMemberParams(
                                        mateUuid: state.data.mateUuid,
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
                ),
              ),
            ],
          ),
      ],
    );
  }
}
