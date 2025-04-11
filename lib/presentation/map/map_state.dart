part of 'map_view_model.dart';

@freezed
class MapState with _$MapState {
  factory MapState({
    @Default(<PreferenceModel>[]) List<PreferenceModel> preferences,
    @Default(Status.loading) Status getAllPreferencesStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getAllPreferencesException,
    @Default(<StoreByLocationModel>[])
    List<StoreByLocationModel> storesByLocation,
    @Default(37.514575) double lat,
    @Default(127.0495556) double lng,
    @Default(5) double radius,
    @Default(<int>[]) List<int> preferenceTagIds,
    @Default('') String searchKeyword,
    @Default(Status.loading) Status getStoresByLocationStatus,
    @Default(Status.loading) Status getMyPreferencesStoresByLocationStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getStoresByLocationExceptionModel,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getMyPreferencesStoresByLocationExceptionModel,
  }) = _MapState;
}
