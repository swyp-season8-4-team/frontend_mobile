class UserDetailModel {
  const UserDetailModel({
    required this.userUuid,
    required this.nickname,
    required this.gender,
    required this.profileImageUrl,
    required this.preferences,
    required this.mbti,
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.isPreferencesSet,
  });

  final String userUuid;
  final String nickname;
  final String? gender;
  final String? profileImageUrl;
  final List<int> preferences;
  final String? mbti;
  final String email;
  final String? name;
  final String? phoneNumber;
  final String? address;
  final bool isPreferencesSet;
}
