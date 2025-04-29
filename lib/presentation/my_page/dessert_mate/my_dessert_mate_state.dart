part of 'my_dessert_mate_view_model.dart';

@freezed
class MyDessertMateState with _$MyDessertMateState {
  factory MyDessertMateState({
    @Default(Status.loading) Status getMyMateStatus,
    @Default(MateModel(mates: <MateDetailModel>[], last: false)) MateModel data,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getMyMateException,
  }) = _MyDessertMateState;
}
