import 'package:collection/collection.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/params/no_params.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';
import 'package:frontend_mobile/domain/model/store/store_by_location_model.dart';
import 'package:frontend_mobile/domain/model/store/store_summary_model.dart';
import 'package:frontend_mobile/domain/model/user_store/user_store_list_model.dart';
import 'package:frontend_mobile/domain/param/store/get_my_preferences_stores_by_location_params.dart';
import 'package:frontend_mobile/domain/param/store/get_store_summary_params.dart';
import 'package:frontend_mobile/domain/param/store/get_stores_by_location_params.dart';
import 'package:frontend_mobile/domain/param/user_store/get_user_store_list_all_params.dart';
import 'package:frontend_mobile/domain/usecase/preference/get_all_preferences_usecase.dart';
import 'package:frontend_mobile/domain/usecase/store/get_my_preferences_stores_by_location_usecase.dart';
import 'package:frontend_mobile/domain/usecase/store/get_store_summary_usecase.dart';
import 'package:frontend_mobile/domain/usecase/store/get_stores_by_location_usecase.dart';
import 'package:frontend_mobile/domain/usecase/user_store/get_user_store_list_all_usecase.dart';

part 'map_state.dart';
part 'generated/map_view_model.freezed.dart';

final AutoDisposeStateNotifierProvider<MapViewModel, MapState>
mapViewModelProvider =
    StateNotifierProvider.autoDispose<MapViewModel, MapState>((Ref ref) {
      return MapViewModel(ref: ref);
    });

class MapViewModel extends StateNotifier<MapState> {
  MapViewModel({required Ref<Object?> ref}) : _ref = ref, super(MapState()) {
    getAllPrferences();
  }

  final Ref _ref;

  // 모든 선호도 조회
  Future<MapState> getAllPrferences() async {
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
    state = state.copyWith(getStoresByLocationStatus: Status.loading);

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
      // TODO: preferenceTagIds에 맞춤 취향 지정 예정
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
  Future<MapState> getStoreSummary({required NMarker overlay}) async {
    state = state.copyWith(
      selectedMarker: overlay,
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

  // 저장 리스트 전체 조회
  Future<MapState> getUserStoreListAll({required String userUuid}) async {
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
          userStores: success.data,
        );
      },
      failure: (Failure<List<UserStoreListModel>, CustomException> failure) {
        state = state.copyWith(
          getUserStoreListAllStatus: Status.failure,
          getUserStoreListAllException: failure.exception.model,
        );
      },
    );

    return state;
  }
}
