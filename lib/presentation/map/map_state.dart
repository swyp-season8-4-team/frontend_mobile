part of 'map_view_model.dart';

// TODO: MapView에 필요한 상태값 추가 예정
@freezed
class MapState with _$MapState {
  factory MapState({
    @Default(<PreferenceModel>[]) List<PreferenceModel> preferences,
    @Default(Status.loading) Status getAllPreferencesStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getAllPreferencesException,
  }) = _MapState;
}
