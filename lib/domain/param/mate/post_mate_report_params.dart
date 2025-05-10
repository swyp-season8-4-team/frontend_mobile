class PostMateReportParams {
  const PostMateReportParams({
    required this.mateUuid,
    required this.userUuid,
    required this.reportCategoryId,
    this.reportComment,
  });

  final String mateUuid;
  final String userUuid;
  final int reportCategoryId;
  final String? reportComment;
}
