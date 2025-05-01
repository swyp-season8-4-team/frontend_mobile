import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/param/user_store/delete_user_store_list_params.dart';
import 'package:frontend_mobile/domain/usecase/user_store/delete_user_store_list_usecase.dart';

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
}
