import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/params/no_params.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/user/blocked_user_list_model.dart';
import 'package:frontend_mobile/domain/model/user/blocked_user_model.dart';
import 'package:frontend_mobile/domain/param/user/unblock_user_params.dart';
import 'package:frontend_mobile/domain/usecase/user/get_blocked_users_usecase.dart';
import 'package:frontend_mobile/domain/usecase/user/unblock_user_usecase.dart';

part 'blocked_user_list_state.dart';
part 'generated/blocked_user_list_view_model.freezed.dart';

final AutoDisposeStateNotifierProvider<
  BlockedUserListViewModel,
  BlockedUserListState
>
blockedUserListViewModelProvider = StateNotifierProvider.autoDispose<
  BlockedUserListViewModel,
  BlockedUserListState
>((Ref ref) {
  return BlockedUserListViewModel(ref: ref);
});

class BlockedUserListViewModel extends StateNotifier<BlockedUserListState> {
  BlockedUserListViewModel({required Ref<Object?> ref})
    : _ref = ref,
      super(BlockedUserListState());

  final Ref _ref;

  /// 차단된 유저 목록 조회
  Future<void> getBlockedUsers() async {
    state = state.copyWith(getBlockedUsersStatus: Status.loading);

    final Result<BlockedUserListModel, CustomException> result =
        await Usecase.execute(
          usecase: _ref.read(getBlockedUsersUsecaseProvider),
          params: NoParams(),
        );

    result.map(
      success: (Success<BlockedUserListModel, CustomException> success) {
        state = state.copyWith(
          getBlockedUsersStatus: Status.success,
          blockedList: success.data,
        );
      },
      failure: (Failure<BlockedUserListModel, CustomException> failure) {
        state = state.copyWith(
          getBlockedUsersStatus: Status.failure,
          getBlockedUsersException: failure.exception.model,
        );
      },
    );
  }

  /// 차단 해제
  Future<void> unblockUser({required int blockId}) async {
    state = state.copyWith(unblockUserStatus: Status.loading);

    final Result<void, CustomException> result = await Usecase.execute(
      usecase: _ref.read(unblockUserUsecaseProvider),
      params: UnblockUserParams(blockId: blockId),
    );

    result.map(
      success: (Success<void, CustomException> success) {
        state = state.copyWith(unblockUserStatus: Status.success);
      },
      failure: (Failure<void, CustomException> failure) {
        state = state.copyWith(
          unblockUserStatus: Status.failure,
          unblockUserException: failure.exception.model,
        );
      },
    );
  }
}
