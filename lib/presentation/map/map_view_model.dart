import 'package:collection/collection.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';
import 'package:frontend_mobile/domain/model/store/store_by_location_model.dart';
import 'package:frontend_mobile/domain/model/store/store_summary_model.dart';
import 'package:frontend_mobile/domain/param/store/get_my_preferences_stores_by_location_params.dart';
import 'package:frontend_mobile/domain/param/store/get_store_summary_params.dart';
import 'package:frontend_mobile/domain/param/store/get_stores_by_location_params.dart';
import 'package:frontend_mobile/domain/param/user_store/delete_user_store_list_params.dart';
import 'package:frontend_mobile/domain/usecase/store/get_my_preferences_stores_by_location_usecase.dart';
import 'package:frontend_mobile/domain/usecase/store/get_store_summary_usecase.dart';
import 'package:frontend_mobile/domain/usecase/store/get_stores_by_location_usecase.dart';
import 'package:frontend_mobile/domain/usecase/user_store/delete_user_store_list_usecase.dart';
import 'package:frontend_mobile/presentation/global/user/user_view_model.dart';

part 'map_state.dart';
part 'generated/map_view_model.freezed.dart';

final AutoDisposeStateNotifierProvider<MapViewModel, MapState>
mapViewModelProvider =
    StateNotifierProvider.autoDispose<MapViewModel, MapState>((Ref ref) {
      return MapViewModel(ref: ref);
    });

class MapViewModel extends StateNotifier<MapState> {
  MapViewModel({required Ref<Object?> ref}) : _ref = ref, super(MapState());

  final Ref _ref;

  // 주어진 위치에서 가게 조회
  void getStoresByCameraPosition({
    required double lat,
    required double lng,
    required double radius,
  }) {
    state = state.copyWith(lat: lat, lng: lng, radius: radius);
    getStoresByLocation();
  }

  // 반경 내 가게 조회
  Future<MapState> getStoresByLocation() async {
    state = state.copyWith(
      selectedMarker: null,
      selectedListId: null,
      getStoresByLocationStatus: Status.loading,
    );

    final Result<List<StoreByLocationModel>, CustomException> result =
        await Usecase.execute(
          usecase: _ref.read(getStoresByLocationUsecaseProvider),
          params: GetStoresByLocationParams(
            latitude: state.lat,
            longitude: state.lng,
            radius: state.radius,
            preferenceTagIds: state.preferenceTagIds,
            searchKeyword: state.searchKeyword,
          ),
        );

    result.map(
      success: (Success<List<StoreByLocationModel>, CustomException> success) {
        state = state.copyWith(
          getStoresByLocationStatus: Status.success,
          storesByLocation: success.data,
        );
      },
      failure: (Failure<List<StoreByLocationModel>, CustomException> failure) {
        state = state.copyWith(
          getStoresByLocationStatus: Status.failure,
          getStoresByLocationExceptionModel: failure.exception.model,
        );
      },
    );

    return state;
  }

  // 반경 내 취향에 맞는 가게 조회
  Future<MapState> getMyPreferencesStoresByLocation() async {
    state = state.copyWith(
      getMyPreferencesStoresByLocationStatus: Status.loading,
    );

    final Result<List<StoreByLocationModel>, CustomException> result =
        await Usecase.execute(
          usecase: _ref.read(getMyPreferencesStoresByLocationUsecaseProvider),
          params: GetMyPreferencesStoresByLocationParams(
            longitude: state.lng,
            latitude: state.lat,
            radius: state.radius,
          ),
        );

    result.map(
      success: (Success<List<StoreByLocationModel>, CustomException> success) {
        state = state.copyWith(
          getMyPreferencesStoresByLocationStatus: Status.success,
          storesByLocation: success.data,
        );
      },
      failure: (Failure<List<StoreByLocationModel>, CustomException> failure) {
        state = state.copyWith(
          getMyPreferencesStoresByLocationStatus: Status.failure,
          getMyPreferencesStoresByLocationExceptionModel:
              failure.exception.model,
        );
      },
    );

    return state;
  }

  // 주어진 영역 내에서 내 취향 필터 업데이트를 통한 가게 조회
  void updateMyPreferenceFilter({
    required double lat,
    required double lng,
    required double radius,
  }) async {
    if (state.myPreferenceFilterSelected) {
      state = state.copyWith(preferenceTagIds: <int>[]);
    } else {
      final UserState userState = _ref.read(userViewModelProvider);
      state = state.copyWith(preferenceTagIds: userState.data.preferences);
    }

    state = state.copyWith(
      myPreferenceFilterSelected: !state.myPreferenceFilterSelected,
    );

    getStoresByCameraPosition(lat: lat, lng: lng, radius: radius);
  }

  // 주어진 영역 내에서 취향 필터 업데이트를 통한 가게 조회
  void updatePreferenceFilter({
    required double lat,
    required double lng,
    required double radius,
    required PreferenceModel preference,
  }) {
    state = state.copyWith(lat: lat, lng: lng, radius: radius);

    // 내 취향 필터가 이미 선택되어 있었다면
    // 내 취향 필터 선택 해제 처리
    if (state.myPreferenceFilterSelected) {
      state = state.copyWith(myPreferenceFilterSelected: false);
    }

    final int? selectablePreference = state.preferenceTagIds?.firstWhereOrNull(
      (int e) => e == preference.id,
    );

    if (selectablePreference != null) {
      state = state.copyWith(
        preferenceTagIds:
            state.preferenceTagIds
                ?.where((int e) => e != selectablePreference)
                .toList(),
      );
    } else {
      state = state.copyWith(
        preferenceTagIds: <int>[
          ...state.preferenceTagIds ?? <int>[],
          preference.id,
        ],
      );
    }

    getStoresByCameraPosition(lat: lat, lng: lng, radius: radius);
  }

  // 모든 필터 해제 후 주어진 영역 내 가게 조회
  void clearAllFilter({
    required double lat,
    required double lng,
    required double radius,
  }) {
    state = state.copyWith(preferenceTagIds: <int>[]);

    getStoresByCameraPosition(lat: lat, lng: lng, radius: radius);
  }

  // 가게 간략 정보 조회
  Future<MapState> getStoreSummary({
    required NMarker overlay,
    int? listId,
  }) async {
    state = state.copyWith(
      selectedMarker: overlay,
      selectedListId: listId,
      getStoreSummaryStatus: Status.loading,
    );

    final Result<StoreSummaryModel, CustomException> result =
        await Usecase.execute(
          usecase: _ref.read(getStoreSummaryUsecaseProvider),
          params: GetStoreSummaryParams(storeUuid: overlay.info.id),
        );

    result.map(
      success: (Success<StoreSummaryModel, CustomException> success) {
        state = state.copyWith(
          getStoreSummaryStatus: Status.success,
          storeSummary: success.data,
        );
      },
      failure: (Failure<StoreSummaryModel, CustomException> failure) {
        state = state.copyWith(
          getStoreSummaryStatus: Status.failure,
          getStoreSummaryExceptionModel: failure.exception.model,
        );
      },
    );

    return state;
  }

  // 저장된 가게 리스트 모드 수정
  void updateUserStoreMode({required bool userStoresEnabled}) {
    state = state.copyWith(userStoresEnabled: userStoresEnabled);
  }

  // 저장 리스트 삭제
  Future<MapState> deleteUserStoreList({required int listId}) async {
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

    return state;
  }
}
