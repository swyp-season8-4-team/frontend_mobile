class PostMateReplyReportParams {
  const PostMateReplyReportParams({
    required this.mateUuid,
    required this.replyId,
    required this.userUuid,
    required this.reportCategoryId,
    this.reportComment,
  });

  final String mateUuid;
  final String replyId;
  final String userUuid;
  final int reportCategoryId;
  final String? reportComment;
}
