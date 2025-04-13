part of 'dessert_board_view_model.dart';

@freezed
class DessertBoardState with _$DessertBoardState {
  const factory DessertBoardState({
    @Default(Status.initial) Status status,
    @Default(MateModel(mates: <MateDetailModel>[], last: false)) MateModel data,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel exception,
  }) = _DessertBoardState;
}
