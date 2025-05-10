part of 'report_store_review_view_model.dart';

@freezed
class ReportStoreReviewState with _$ReportStoreReviewState {
  factory ReportStoreReviewState({
    @Default('') String reportComment,
    @Default(1) int reportCategoryId,
    @Default(Status.initial) Status reportStoreReviewStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel reportStoreReviewException,
  }) = _ReportStoreReviewState;
}
