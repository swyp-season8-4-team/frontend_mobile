import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/constant.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/param/store_review/report_review_params.dart';
import 'package:frontend_mobile/domain/usecase/store_review/report_review_usecase.dart';

part 'report_store_review_state.dart';
part 'generated/report_store_review_view_model.freezed.dart';

final AutoDisposeStateNotifierProvider<
  ReportStoreReviewViewModel,
  ReportStoreReviewState
>
reportStoreReviewViewModelProvider = StateNotifierProvider.autoDispose<
  ReportStoreReviewViewModel,
  ReportStoreReviewState
>((Ref ref) {
  return ReportStoreReviewViewModel(ref: ref);
});

class ReportStoreReviewViewModel extends StateNotifier<ReportStoreReviewState> {
  ReportStoreReviewViewModel({required Ref<Object?> ref})
    : _ref = ref,
      super(ReportStoreReviewState());

  final Ref _ref;

  /// 신고 카테고리 id 변경
  void updateReportCategoryId({required int reportCategoryId}) {
    state = state.copyWith(reportCategoryId: reportCategoryId);
  }

  /// 기타 신고 내용 변경
  void updateReportComment({required String reportComment}) {
    state = state.copyWith(reportComment: reportComment);
  }

  /// 한줄 리뷰 신고
  Future<void> reportStoreReview({
    required String storeUuid,
    required String reviewUuid,
    required String userUuid,
  }) async {
    state = state.copyWith(reportStoreReviewStatus: Status.loading);

    final Result<void, CustomException> result = await Usecase.execute(
      usecase: _ref.read(reportReviewUsecaseProvider),
      params: ReportReviewParams(
        storeUuid: storeUuid,
        reviewUuid: reviewUuid,
        userUuid: userUuid,
        reportCategoryId: state.reportCategoryId,
        reportComment:
            state.reportCategoryId == ReportCategory.etc.id
                ? state.reportComment
                : null,
      ),
    );

    result.map(
      success: (Success<void, CustomException> success) {
        state = state.copyWith(reportStoreReviewStatus: Status.success);
      },
      failure: (Failure<void, CustomException> failure) {
        state = state.copyWith(
          reportStoreReviewStatus: Status.failure,
          reportStoreReviewException: failure.exception.model,
        );
      },
    );
  }
}
