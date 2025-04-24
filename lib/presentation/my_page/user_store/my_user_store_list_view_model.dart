import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/user_store/user_store_list_model.dart';
import 'package:frontend_mobile/domain/param/user_store/delete_user_store_list_params.dart';
import 'package:frontend_mobile/domain/param/user_store/get_user_store_list_all_params.dart';
import 'package:frontend_mobile/domain/usecase/user_store/delete_user_store_list_usecase.dart';
import 'package:frontend_mobile/domain/usecase/user_store/get_user_store_list_all_usecase.dart';
import 'package:frontend_mobile/presentation/map/map_view_model.dart';

part 'my_user_store_list_state.dart';
part 'generated/my_user_store_list_view_model.freezed.dart';

final AutoDisposeStateNotifierProvider<
  MyUserStoreListViewModel,
  MyUserStoreListState
>
myUserStoreListViewModelProvider = StateNotifierProvider.autoDispose<
  MyUserStoreListViewModel,
  MyUserStoreListState
>((Ref ref) {
  return MyUserStoreListViewModel(ref: ref);
});

class MyUserStoreListViewModel extends StateNotifier<MyUserStoreListState> {
  MyUserStoreListViewModel({required Ref<Object?> ref})
    : _ref = ref,
      super(MyUserStoreListState());

  final Ref _ref;

  /// 저장 리스트 전체 조회
  Future<void> getUserStoreListAll({required String userUuid}) async {
    state = state.copyWith(getUserStoreListAllStatus: Status.loading);

    final Result<List<UserStoreListModel>, CustomException> result =
        await Usecase.execute(
          usecase: _ref.read(getUserStoreListAllUsecaseProvider),
          params: GetUserStoreListAllParams(userUuid: userUuid),
        );

    result.map(
      success: (Success<List<UserStoreListModel>, CustomException> success) {
        state = state.copyWith(
          getUserStoreListAllStatus: Status.success,
          userStoreLists: success.data,
          userStoreListOptionMenuVisible:
              success.data
                  .map(
                    (UserStoreListModel e) => (
                      listId: e.listId,
                      isOptionMenuVisible: false,
                    ),
                  )
                  .toList(),
        );
      },
      failure: (Failure<List<UserStoreListModel>, CustomException> failure) {
        state = state.copyWith(
          getUserStoreListAllStatus: Status.failure,
          getUserStoreListAllException: failure.exception.model,
        );
      },
    );
  }

  /// 저장 리스트 삭제
  Future<void> deleteUserStoreList({required int listId}) async {
    state = state.copyWith(deleteUserStoreListStatus: Status.loading);

    final Result<void, CustomException> result = await Usecase.execute(
      usecase: _ref.read(deleteUserStoreListUsecaseProvider),
      params: DeleteUserStoreListParams(listId: listId),
    );

    result.map(
      success: (Success<void, CustomException> success) {
        state = state.copyWith(deleteUserStoreListStatus: Status.success);
      },
      failure: (Failure<void, CustomException> failure) {
        state = state.copyWith(
          deleteUserStoreListStatus: Status.failure,
          deleteUserStoreListException: failure.exception.model,
        );
      },
    );
  }

  /// 표시되고 있는 모든 옵션 메뉴들을 제거
  void invisibleAllOptionMenu() {
    state = state.copyWith(
      userStoreListOptionMenuVisible:
          state.userStoreListOptionMenuVisible
              .map(
                (({bool isOptionMenuVisible, int listId}) e) => (
                  listId: e.listId,
                  isOptionMenuVisible: false,
                ),
              )
              .toList(),
    );
  }

  /// 특정 저장리스트의 옵션 메뉴 표시 여부 수정
  void updateStoreListOptionMenuVisible({
    required int listId,
    required bool isVisible,
  }) async {
    state = state.copyWith(
      userStoreListOptionMenuVisible:
          state.userStoreListOptionMenuVisible
              .map(
                (({bool isOptionMenuVisible, int listId}) e) =>
                    e.listId == listId
                        ? (listId: listId, isOptionMenuVisible: isVisible)
                        : e,
              )
              .toList(),
    );
  }
}
