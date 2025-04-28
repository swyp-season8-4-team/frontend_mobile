part of 'user_store_list_view_model.dart';

@freezed
class UserStoreListState with _$UserStoreListState {
  factory UserStoreListState({
    @Default(<UserStoreListOptionMenuVisible>[])
    List<UserStoreListOptionMenuVisible> userStoreListOptionMenuVisible,
    @Default(<UserStoreListModel>[]) List<UserStoreListModel> userStoreLists,
    @Default(Status.initial) Status getUserStoreListAllStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getUserStoreListAllException,
  }) = _UserStoreListState;

  const UserStoreListState._();

  // 찜한 가게 개수
  int get storeAllCount => userStoreLists.fold(
    0,
    (int prev, UserStoreListModel next) => prev + next.storeCount,
  );
}
