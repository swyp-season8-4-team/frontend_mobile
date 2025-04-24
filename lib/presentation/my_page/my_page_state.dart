part of 'my_page_view_model.dart';

@freezed
class MyPageState with _$MyPageState {
  factory MyPageState({
    @Default(<UserStoreListModel>[]) List<UserStoreListModel> userStoreLists,
    @Default(Status.loading) Status getUserStoreListAllStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getUserStoreListAllException,
  }) = _MyPageState;

  const MyPageState._();

  // 찜한 가게 개수
  int get storeAllCount => userStoreLists.fold(
    0,
    (int prev, UserStoreListModel next) => prev + next.storeCount,
  );
}
