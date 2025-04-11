part of 'map_view_model.dart';

// TODO: MapView에 필요한 상태값 추가 예정
@freezed
class MapState with _$MapState {
  factory MapState({
    @Default(<PreferenceModel>[]) List<PreferenceModel> preferences,
    @Default(Status.loading) Status getAllPreferencesStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getAllPreferencesException,
    @Default(<StoreByLocationModel>[])
    List<StoreByLocationModel> storesByLocation,
    @Default(GetStoresByLocationParams(latitude: 0, longitude: 0, radius: 0))
    GetStoresByLocationParams getStoresByLocationParams,
    @Default(
      GetMyPreferencesStoresByLocationParams(
        latitude: 0,
        longitude: 0,
        radius: 0,
      ),
    )
    GetMyPreferencesStoresByLocationParams
    getMyPreferencesStoresByLocationParams,
    @Default(Status.loading) Status getStoresByLocationStatus,
    @Default(Status.loading) Status getMyPreferencesStoresByLocationStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getStoresByLocationExceptionModel,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getMyPreferencesStoresByLocationExceptionModel,
  }) = _MapState;
}
