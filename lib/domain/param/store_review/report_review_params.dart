class ReportReviewParams {
  const ReportReviewParams({
    required this.storeUuid,
    required this.reviewUuid,
    required this.userUuid,
    required this.reportCategoryId,
    this.reportComment,
  });
  final String storeUuid;
  final String reviewUuid;
  final String userUuid;
  final int reportCategoryId;
  final String? reportComment;
}
