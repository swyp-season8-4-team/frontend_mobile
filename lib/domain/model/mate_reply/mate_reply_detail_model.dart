class MateReplyDetailModel {
  MateReplyDetailModel({
    required this.mateReplyId,
    required this.parentMateReplyId,
    required this.userUuid,
    required this.nickname,
    required this.content,
    required this.profileImage,
    required this.gender,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.children,
  });

  final int mateReplyId;
  final int? parentMateReplyId;
  final String userUuid;
  final String nickname;
  final String content;
  final String profileImage;
  final String gender;
  final String createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final List<MateReplyDetailModel> children;
}
