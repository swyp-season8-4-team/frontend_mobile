import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/domain/param/mate_member/post_mate_member_params.dart';
import 'package:frontend_mobile/presentation/dessert/post/dessert_post_view_model.dart';

class DessertPostParticipantNone extends ConsumerWidget {
  const DessertPostParticipantNone({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DessertPostState state = ref.watch(dessertPostViewModelProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: ScaleColorConfig.neutral50)),
      ),
      child:
          state.data.currentMemberCount == state.data.capacity
              ? const CustomFillButton.medium(
                label: '이미 마감된 모임입니다',
                disabled: true,
                onPressed: null,
              )
              : CustomFillButton.medium(
                label: '참여요청',
                onPressed: () {
                  ref
                      .read(dessertPostViewModelProvider.notifier)
                      .postMateMember(
                        params: PostMateMemberParams(
                          mateUuid: state.data.mateUuid,
                        ),
                      );
                },
              ),
    );
  }
}
