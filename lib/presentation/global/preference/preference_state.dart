part of 'preference_view_model.dart';

@freezed
class PreferenceState with _$PreferenceState {
  const factory PreferenceState({
    @Default(Status.initial) Status status,
    @Default(<PreferenceModel>[]) List<PreferenceModel> data,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel exception,
  }) = _PreferenceState;
}
