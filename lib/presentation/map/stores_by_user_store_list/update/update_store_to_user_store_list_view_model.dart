import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/param/user_store/update_store_to_user_store_list_params.dart';
import 'package:frontend_mobile/domain/usecase/user_store/update_stores_to_user_store_list_usecase.dart';

part 'generated/update_store_to_user_store_list_view_model.freezed.dart';
part 'update_store_to_user_store_list_state.dart';

final AutoDisposeStateNotifierProvider<
  UpdateStoreToUserStoreListViewModel,
  UpdateStoreToUserStoreListState
>
updateStoreToUserStoreListViewModelProvider = StateNotifierProvider.autoDispose<
  UpdateStoreToUserStoreListViewModel,
  UpdateStoreToUserStoreListState
>((Ref ref) {
  return UpdateStoreToUserStoreListViewModel(ref: ref);
});

class UpdateStoreToUserStoreListViewModel
    extends StateNotifier<UpdateStoreToUserStoreListState> {
  UpdateStoreToUserStoreListViewModel({required Ref<Object?> ref})
    : _ref = ref,
      super(UpdateStoreToUserStoreListState());

  final Ref _ref;

  /// 선택된 리스트 상태 초기화 (초기값 설정)
  void initList({required List<int> listIds}) {
    state = state.copyWith(listIds: listIds);
  }

  /// 리스트의 가게 저장 수정
  void updateList({required int listId}) {
    final bool result =
        state.listIds.firstWhereOrNull((int e) => e == listId) != null;

    if (result) {
      state = state.copyWith(
        listIds: state.listIds.where((int e) => e != listId).toList(),
      );
    } else {
      state = state.copyWith(listIds: <int>{...state.listIds, listId}.toList());
    }
  }

  /// 여러리스트에 가게 저장
  Future<void> updateStoreToUserStoreList({
    required String storeUuid,
    required List<int> userPreferences,
  }) async {
    state = state.copyWith(updateStoreToUserStoreListStatus: Status.loading);

    final Result<void, CustomException> result = await Usecase.execute(
      usecase: _ref.read(updateStoresToUserStoreListUsecaseProvider),
      params: UpdateStoreToUserStoreListParams(
        storeUuid: storeUuid,
        selectedLists:
            state.listIds
                .map(
                  (int e) => UpdateStoreSelectedList(
                    listId: e,
                    userPreferences:
                        userPreferences.isEmpty ? null : userPreferences,
                  ),
                )
                .toList(),
      ),
    );

    result.map(
      success: (Success<void, CustomException> success) {
        state = state.copyWith(
          updateStoreToUserStoreListStatus: Status.success,
        );
      },
      failure: (Failure<void, CustomException> failure) {
        state = state.copyWith(
          updateStoreToUserStoreListStatus: Status.failure,
          updateStoreToUserStoreListException: failure.exception.model,
        );
      },
    );
  }
}
