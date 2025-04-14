part of 'store_detail_view_model.dart';

@freezed
class StoreDetailState with _$StoreDetailState {
  factory StoreDetailState({
    StoreDetailModel? storeDetail,
    @Default(Status.loading) Status getStoreDetailStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getStoreDetailException,
  }) = _StoreDetailState;
}
