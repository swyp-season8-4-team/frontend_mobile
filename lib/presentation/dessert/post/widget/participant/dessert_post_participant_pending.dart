import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/outline_button.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/domain/param/mate_member/delete_mate_member_params.dart';
import 'package:frontend_mobile/presentation/dessert/post/dessert_post_view_model.dart';
import 'package:go_router/go_router.dart';

class DessertPostParticipantPending extends ConsumerWidget {
  const DessertPostParticipantPending({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DessertPostState state = ref.watch(dessertPostViewModelProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: ScaleColorConfig.neutral50)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: CustomOutlineButton.medium(
              label: '요청 취소',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialog.basic(
                      description: '디저트 메이트 참여요청을\n취소하시겠습니까?',
                      primaryButton: CustomDialogButton(
                        text: '요청취소',
                        warning: true,
                        onTap: () {
                          ref
                              .read(dessertPostViewModelProvider.notifier)
                              .deleteMateMember(
                                params: DeleteMateMemberParams(
                                  mateUuid: state.data.mateUuid,
                                ),
                              );
                          context.pop();
                        },
                      ),
                      secondaryButton: CustomDialogButton(
                        text: '대기',
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
          const SizedBox(width: 10),
          const Expanded(
            child: CustomFillButton.medium(
              label: '승인 대기중',
              disabled: true,
              onPressed: null,
            ),
          ),
        ],
      ),
    );
  }
}
