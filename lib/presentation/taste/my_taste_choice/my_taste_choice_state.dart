part of 'my_taste_choice_view_model.dart';

@freezed
class MyTasteChoiceState with _$MyTasteChoiceState {
  const factory MyTasteChoiceState({
    @Default(<int>[]) List<int> preferenceStep1,
    @Default(<int>[]) List<int> preferenceStep2,
    @Default(<int>[]) List<int> preferenceStep3,
    @Default(<int>[]) List<int> preferenceStep4,
  }) = _MyTasteChoiceState;
}
