import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user_detail_entity.g.dart';

@JsonSerializable()
class UserDetailEntity {
  const UserDetailEntity({
    this.userUuid = '',
    this.nickname = '',
    this.gender,
    this.profileImageUrl,
    this.preferences = const <int>[],
    this.mbti,
    this.email = '',
    this.name,
    this.phoneNumber,
    this.address,
    this.isPreferencesSet = false,
  });

  factory UserDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$UserDetailEntityFromJson(json);

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
