part of 'dessert_board_view_model.dart';

@freezed
class DessertBoardState with _$DessertBoardState {
  const factory DessertBoardState({
    @Default(Status.initial) Status getMateStatus,
    @Default(Status.initial) Status updateMateBlockDataStatus,
    @Default('') String blockedUserNickname,
    @Default(MateModel(mates: <MateDetailModel>[], last: false)) MateModel data,
    @Default(MateModel(mates: <MateDetailModel>[], last: false))
    MateModel backupData,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel exception,
  }) = _DessertBoardState;
}
