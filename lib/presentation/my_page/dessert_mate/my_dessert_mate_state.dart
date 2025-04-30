part of 'my_dessert_mate_view_model.dart';

enum TabFilterStatus { all, isRecruiting, recruitDone }

typedef TabFilter = ({int tabIndex, TabFilterStatus filter});

@freezed
class MyDessertMateState with _$MyDessertMateState {
  factory MyDessertMateState({
    @Default(<TabFilter>[]) List<TabFilter> tabsFilter,
    @Default(Status.loading) Status getMyMateStatus,
    @Default(MateModel(mates: <MateDetailModel>[], last: false)) MateModel data,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getMyMateException,
  }) = _MyDessertMateState;

  const MyDessertMateState._();
}
