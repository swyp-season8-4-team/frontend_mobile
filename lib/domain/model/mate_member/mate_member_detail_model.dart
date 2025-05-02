class MateMemberDetailModel {
  const MateMemberDetailModel({
    required this.userId,
    required this.userUuid,
    required this.grade,
    required this.profileImage,
    required this.nickname,
    required this.applyStatus,
    required this.gender,
  });

  final int userId;
  final String userUuid;
  final String grade;
  final String profileImage;
  final String nickname;
  final String applyStatus;
  final String gender;
}
