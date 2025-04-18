import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/user_store/user_store_list_model.dart';
import 'package:frontend_mobile/domain/param/user_store/get_stores_by_user_store_list_params.dart';
import 'package:frontend_mobile/domain/usecase/user_store/get_stores_by_user_store_list_usecase.dart';

part 'stores_by_user_store_list_state.dart';
part 'generated/stores_by_user_store_list_view_model.freezed.dart';

final AutoDisposeStateNotifierProvider<
  StoresByUserStoreListViewModel,
  StoresByUserStoreListState
>
storesByUserStoreListViewModelProvider = StateNotifierProvider.autoDispose<
  StoresByUserStoreListViewModel,
  StoresByUserStoreListState
>((Ref ref) {
  return StoresByUserStoreListViewModel(ref: ref);
});

class StoresByUserStoreListViewModel
    extends StateNotifier<StoresByUserStoreListState> {
  StoresByUserStoreListViewModel({required Ref<Object?> ref})
    : _ref = ref,
      super(StoresByUserStoreListState());

  final Ref _ref;

  // 특정 저장 리스트 내 가게 조회
  Future<StoresByUserStoreListState> getStores({required int listId}) async {
    state = state.copyWith(getStoresByUserStoreListStatus: Status.loading);

    final Result<UserStoreListModel, CustomException> result =
        await Usecase.execute(
          usecase: _ref.read(getStoresByUserStoreListUsecaseProvider),
          params: GetStoresByUserStoreListParams(listId: listId),
        );

    result.map(
      success: (Success<UserStoreListModel, CustomException> success) {
        state = state.copyWith(
          getStoresByUserStoreListStatus: Status.success,
          stores: success.data,
        );
      },
      failure: (Failure<UserStoreListModel, CustomException> failure) {
        state = state.copyWith(
          getStoresByUserStoreListStatus: Status.failure,
          getStoresByUserStoreListException: failure.exception.model,
        );
      },
    );

    return state;
  }
}
