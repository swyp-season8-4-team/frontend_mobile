part of 'report_store_review_view_model.dart';

@freezed
class ReportStoreReviewState with _$ReportStoreReviewState {
  factory ReportStoreReviewState({
    @Default('') String reportComment,
    @Default(-1) int reportCategoryId,
    @Default(Status.initial) Status reportStoreReviewStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel reportStoreReviewException,
  }) = _ReportStoreReviewState;

  const ReportStoreReviewState._();

  bool get summitButtonEnabled {
    if (reportStoreReviewStatus.isLoading) {
      return false;
    }

    if (reportCategoryId > 0) {
      if (reportCategoryId == ReportCategory.etc.id) {
        return reportComment.trim().isNotEmpty;
      }

      return true;
    }

    return false;
  }
}
