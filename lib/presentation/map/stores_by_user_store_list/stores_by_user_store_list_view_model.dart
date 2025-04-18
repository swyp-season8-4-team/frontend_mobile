import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/params/no_params.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';
import 'package:frontend_mobile/domain/model/user_store/user_store_list_model.dart';
import 'package:frontend_mobile/domain/param/user_store/get_stores_by_user_store_list_params.dart';
import 'package:frontend_mobile/domain/usecase/preference/get_all_preferences_usecase.dart';
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

  // 전체 취향 조회
  // TODO: 추후 전역 상태를 통해 대체될 것으로 예상됨
  Future<StoresByUserStoreListState> getPreferences() async {
    state = state.copyWith(getAllPreferencesStatus: Status.loading);

    final Result<List<PreferenceModel>, CustomException> result =
        await Usecase.execute(
          usecase: _ref.read(getAllPreferencesUsecaseProvider),
          params: NoParams(),
        );

    result.map(
      success: (Success<List<PreferenceModel>, CustomException> success) {
        state = state.copyWith(
          getAllPreferencesStatus: Status.success,
          preferences: success.data,
        );
      },
      failure: (Failure<List<PreferenceModel>, CustomException> failure) {
        state = state.copyWith(
          getAllPreferencesStatus: Status.failure,
          getAllPreferencesException: failure.exception.model,
        );
      },
    );

    return state;
  }

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
          storeList: success.data,
          storeOptionMenuVisibleList:
              success.data.storeData != null
                  ? success.data.storeData!
                      .map(
                        (UserStoreModel e) => (
                          storeUuid: e.storeUuid,
                          isOptionMenuVisible: false,
                        ),
                      )
                      .toList()
                  : <({bool isOptionMenuVisible, String storeUuid})>[],
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

  // 표시되고 있는 모든 옵션 메뉴들을 제거
  void invisibleAllStoreOptionMenu() {
    state = state.copyWith(
      storeOptionMenuVisibleList:
          state.storeOptionMenuVisibleList
              .map(
                (({bool isOptionMenuVisible, String storeUuid}) e) => (
                  storeUuid: e.storeUuid,
                  isOptionMenuVisible: false,
                ),
              )
              .toList(),
    );
  }

  // 특정 가게의 옵션 메뉴 표시 여부 수정
  void updateStoreOptionMenuVisible({
    required String storeUuid,
    required bool isVisible,
  }) async {
    state = state.copyWith(
      storeOptionMenuVisibleList:
          state.storeOptionMenuVisibleList
              .map(
                (({bool isOptionMenuVisible, String storeUuid}) e) =>
                    e.storeUuid == storeUuid
                        ? (storeUuid: storeUuid, isOptionMenuVisible: isVisible)
                        : e,
              )
              .toList(),
    );
  }
}
