part of 'store_notice_view_model.dart';

@freezed
class StoreNoticeState with _$StoreNoticeState {
  factory StoreNoticeState({
    @Default(<StoreNoticeModel>[]) List<StoreNoticeModel> storeNotices,
    @Default(Status.loading) Status getStoreNoticesStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getStoreNoticesException,
  }) = _StoreNoticeState;
}
