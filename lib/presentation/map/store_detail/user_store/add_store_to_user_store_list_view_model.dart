import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/param/user_store/add_store_to_user_store_list_params.dart';
import 'package:frontend_mobile/domain/usecase/user_store/add_store_to_user_store_list_usecase.dart';

part 'add_store_to_user_store_list_state.dart';
part 'generated/add_store_to_user_store_list_view_model.freezed.dart';

final AutoDisposeStateNotifierProvider<
  AddStoreToUserStoreListViewModel,
  AddStoreToUserStoreListState
>
addStoreToUserStoreListViewModelProvider = StateNotifierProvider.autoDispose<
  AddStoreToUserStoreListViewModel,
  AddStoreToUserStoreListState
>((Ref ref) {
  return AddStoreToUserStoreListViewModel(ref: ref);
});

class AddStoreToUserStoreListViewModel
    extends StateNotifier<AddStoreToUserStoreListState> {
  AddStoreToUserStoreListViewModel({required Ref<Object?> ref})
    : _ref = ref,
      super(AddStoreToUserStoreListState());

  final Ref _ref;

  void updateList({int? listId}) {
    state = state.copyWith(listId: listId);
  }

  Future<AddStoreToUserStoreListState> addStoreToUserStoreList({
    required String storeUuid,
  }) async {
    state = state.copyWith(addStoreToUserStoreListStatus: Status.loading);

    final Result<void, CustomException> result = await Usecase.execute(
      usecase: _ref.read(addStoreToUserStoreListUsecaseProvider),
      params: AddStoreToUserStoreListParams(
        listId: state.listId!,
        storeUuid: storeUuid,
        preferenceIds: <int>[],
      ),
    );

    result.map(
      success: (Success<void, CustomException> success) {
        state = state.copyWith(addStoreToUserStoreListStatus: Status.success);
      },
      failure: (Failure<void, CustomException> failure) {
        state = state.copyWith(
          addStoreToUserStoreListStatus: Status.failure,
          addStoreToUserStoreListException: failure.exception.model,
        );
      },
    );

    return state;
  }
}
