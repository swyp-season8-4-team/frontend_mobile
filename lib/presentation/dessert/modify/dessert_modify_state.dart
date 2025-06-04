part of 'dessert_modify_view_model.dart';

@freezed
class DessertModifyState with _$DessertModifyState {
  const factory DessertModifyState({
    @Default(Status.initial) Status patchMateStatus,
    @Default(Status.initial) Status deleteMateStatus,

    @Default(MatePatchModel(message: '')) MatePatchModel matePatchData,
    @Default(MateDeleteModel(message: '')) MateDeleteModel mateDeleteData,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel exception,
  }) = _DessertModifyState;
}
