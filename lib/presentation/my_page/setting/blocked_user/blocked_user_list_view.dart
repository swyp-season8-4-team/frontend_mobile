import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/pill_outline_button.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_size.dart';
import 'package:frontend_mobile/common/design_system/component/snackbar/snack_bar.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/core/manager/toast/toast_manager.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/loading/loading_overlay.dart';
import 'package:frontend_mobile/domain/model/user/blocked_user_model.dart';
import 'package:frontend_mobile/presentation/my_page/setting/blocked_user/blocked_user_list_view_model.dart';
import 'package:frontend_mobile/presentation/widget/default_error.dart';
import 'package:go_router/go_router.dart';

class BlockedUserListView extends ConsumerWidget {
  const BlockedUserListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BlockedUserListState state = ref.watch(
      blockedUserListViewModelProvider,
    );
    final BlockedUserListViewModel viewmodel = ref.read(
      blockedUserListViewModelProvider.notifier,
    );

    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    ref.listen(
      blockedUserListViewModelProvider.select(
        (BlockedUserListState state) => state.unblockUserStatus,
      ),
      (Status? prev, Status next) {
        if (next.isSuccess) {
          // 차단 해제에 성공한 경우에 차단 유저를 갱신하기
          viewmodel.getBlockedUsers();
          _showSuccessUnblockUserMessage(context, ref);
        } else if (next.isFailure) {
          _showFailureUnblockUserMessage(context, ref);
        }
      },
    );

    // TODO: 로딩 UI 수정 필요
    if (state.isFirstLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    // FIXME: 에러 UI 임시로 지정
    if (state.getBlockedUsersStatus.isFailure) {
      return Scaffold(
        appBar: const CustomSubTopBar(
          title: '차단 맴버 관리하기',
          actions: <Widget>[],
          primary: false,
        ),
        body: DefaultError(
          onRetry: () {
            viewmodel.getBlockedUsers();
          },
        ),
      );
    }

    return CustomLoadingOverlay(
      isLoading:
          state.getBlockedUsersStatus.isLoading ||
          state.unblockUserStatus.isLoading,
      child: Scaffold(
        appBar: const CustomSubTopBar(
          title: '차단 맴버 관리하기',
          actions: <Widget>[],
          primary: false,
        ),
        body:
            state.blockedList.totalCount <= 0
                ? Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom + 50,
                  ),
                  child: Center(
                    child: Text(
                      '차단된 멤버가 없습니다.',
                      style: textTheme.bodyMedium?.copyWith(
                        color: ScaleColorConfig.neutral30,
                      ),
                    ),
                  ),
                )
                : ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    final BlockedUserModel blockedUser =
                        state.blockedList.blockedUsers[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: _BlockedUserListItem(
                        blockedUser: blockedUser,
                        onUnblockTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomDialog.basic(
                                title: '차단을 해제하시겠습니까?',
                                description: '해제하면 상대방의 모든 디저비\n활동 정보가 표시됩니다',
                                primaryButton: CustomDialogButton(
                                  text: '차단해제',
                                  onTap: () {
                                    viewmodel.unblockUser(
                                      blockId: blockedUser.id,
                                    );
                                    context.pop();
                                  },
                                ),
                                secondaryButton: CustomDialogButton(
                                  text: '아니오',
                                  onTap: () {
                                    context.pop();
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 1,
                      thickness: 1,
                      color: colorScheme.outlineVariant,
                    );
                  },
                  itemCount: state.blockedList.totalCount,
                ),
      ),
    );
  }

  /// 차단 해제 성공 피드백
  void _showSuccessUnblockUserMessage(BuildContext context, WidgetRef ref) {
    final ToastManager toastManager = ref.read(toastManagerProvider);
    toastManager.show(
      context: context,
      toastWidget: const CustomSnackBar(description: '차단이 해제되었습니다'),
    );
  }

  /// 차단 해제 실패 피드백
  // FIXME: 임의로 메세지를 구성함
  void _showFailureUnblockUserMessage(BuildContext context, WidgetRef ref) {
    final ToastManager toastManager = ref.read(toastManagerProvider);
    toastManager.show(
      context: context,
      toastWidget: const CustomSnackBar(description: '차단 해제에 실패했습니다.'),
    );
  }
}

class _BlockedUserListItem extends StatelessWidget {
  const _BlockedUserListItem({
    required this.blockedUser,
    required this.onUnblockTap,
  });
  final BlockedUserModel blockedUser;
  final VoidCallback onUnblockTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      children: <Widget>[
        CustomProfilePhotoSize.boy(size: CustomProfilePhotoSizeEnum.m),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            blockedUser.blockedUserNickname,
            style: textTheme.titleSmall?.copyWith(
              color: ScaleColorConfig.neutral20,
            ),
            maxLines: 1,
          ),
        ),
        CustomPillOutlineButton.xSmall(
          label: '차단해제',
          width: 65,
          onPressed: onUnblockTap,
          isSelected: false,
        ),
      ],
    );
  }
}
