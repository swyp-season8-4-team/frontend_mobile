part of 'blocked_user_list_view_model.dart';

@freezed
class BlockedUserListState with _$BlockedUserListState {
  factory BlockedUserListState({
    @Default(
      BlockedUserListModel(blockedUsers: <BlockedUserModel>[], totalCount: -1),
    )
    BlockedUserListModel blockedList,
    @Default(Status.loading) Status getBlockedUsersStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getBlockedUsersException,

    @Default(Status.initial) Status unblockUserStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel unblockUserException,
  }) = _BlockedUserListState;

  const BlockedUserListState._();

  bool get isFirstLoading =>
      blockedList.totalCount == -1 && getBlockedUsersStatus.isLoading;
}
