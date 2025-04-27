class PostMateReplyParams {
  PostMateReplyParams({
    required this.mateUuid,
    required this.userUuid,
    required this.content,
    this.parentMateReplyId,
  });

  final String mateUuid;
  final String userUuid;
  final String content;
  final int? parentMateReplyId;
}
