class LocalLoginModel {
  const LocalLoginModel({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.expiresIn,
    required this.userUuid,
    required this.email,
    required this.nickname,
    required this.profileImageUrl,
    required this.preferenceSet,
  });

  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int expiresIn;
  final String userUuid;
  final String email;
  final String nickname;
  final String profileImageUrl;
  final bool preferenceSet;
}
