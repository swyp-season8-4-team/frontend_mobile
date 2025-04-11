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
import 'package:frontend_mobile/domain/param/store/get_my_preferences_stores_by_location_params.dart';
import 'package:frontend_mobile/domain/param/store/get_stores_by_location_params.dart';
import 'package:frontend_mobile/domain/usecase/preference/get_all_preferences_usecase.dart';
import 'package:frontend_mobile/domain/usecase/store/get_my_preferences_stores_by_location_usecase.dart';
import 'package:frontend_mobile/domain/usecase/store/get_stores_by_location_usecase.dart';

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

  // 반경 내 가게 조회
  Future<MapState> getStoresByLocation({
    required GetStoresByLocationParams params,
  }) async {
    state = state.copyWith(
      getStoresByLocationStatus: Status.loading,
      getStoresByLocationParams: GetStoresByLocationParams(
        latitude: params.latitude,
        longitude: params.longitude,
        radius: params.radius,
        preferenceTagIds:
            params.preferenceTagIds ??
            state.getStoresByLocationParams.preferenceTagIds,
        searchKeyword:
            params.searchKeyword ??
            state.getStoresByLocationParams.searchKeyword,
      ),
    );

    final Result<List<StoreByLocationModel>, CustomException> result =
        await Usecase.execute(
          usecase: _ref.read(getStoresByLocationUsecaseProvider),
          params: state.getStoresByLocationParams,
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
  Future<MapState> getMyPreferencesStoresByLocation({
    required GetMyPreferencesStoresByLocationParams params,
  }) async {
    state = state.copyWith(
      getMyPreferencesStoresByLocationStatus: Status.loading,
    );

    final Result<List<StoreByLocationModel>, CustomException> result =
        await Usecase.execute(
          usecase: _ref.read(getMyPreferencesStoresByLocationUsecaseProvider),
          params: GetMyPreferencesStoresByLocationParams(
            longitude: params.longitude,
            latitude: params.latitude,
            radius: params.latitude,
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
}
