import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/param/user_store/update_user_store_list_params.dart';
import 'package:frontend_mobile/domain/usecase/user_store/update_user_store_list_usecase.dart';

part 'update_user_store_list_state.dart';
part 'generated/update_user_store_list_view_model.freezed.dart';

final AutoDisposeStateNotifierProvider<
  UpdateUserStoreListViewModel,
  UpdateUserStoreListState
>
updateUserStoreListViewModelProvider = StateNotifierProvider.autoDispose<
  UpdateUserStoreListViewModel,
  UpdateUserStoreListState
>((Ref ref) {
  return UpdateUserStoreListViewModel(ref: ref);
});

class UpdateUserStoreListViewModel
    extends StateNotifier<UpdateUserStoreListState> {
  UpdateUserStoreListViewModel({required Ref<Object?> ref})
    : _ref = ref,
      super(UpdateUserStoreListState());

  final Ref _ref;

  void updateListName({required String newListName}) {
    state = state.copyWith(newListName: newListName);
  }

  void updateIconColorId({required int newIconColorId}) {
    state = state.copyWith(newIconColorId: newIconColorId);
  }

  // 저장 리스트 수정
  Future<UpdateUserStoreListState> updateUserStoreList({
    required int listId,
  }) async {
    state = state.copyWith(updateUserStoreListStatus: Status.loading);

    final Result<void, CustomException> result = await Usecase.execute(
      usecase: _ref.read(updateUserStoreListUsecaseProvider),
      params: UpdateUserStoreListParams(
        listId: listId,
        newIconColorId: state.newIconColorId,
        newName: state.newListName!,
      ),
    );

    result.map(
      success: (Success<void, CustomException> success) {
        state = state.copyWith(updateUserStoreListStatus: Status.success);
      },
      failure: (Failure<void, CustomException> failure) {
        state = state.copyWith(
          updateUserStoreListStatus: Status.failure,
          updateUserStoreListException: failure.exception.model,
        );
      },
    );

    return state;
  }
}
