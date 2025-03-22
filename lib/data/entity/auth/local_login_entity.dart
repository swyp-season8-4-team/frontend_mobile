import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_login_entity.g.dart';

@JsonSerializable()
class LocalLoginEntity {
  LocalLoginEntity({
    this.accessToken = '',
    this.refreshToken = '',
    this.tokenType = '',
    this.expiresIn = -1,
    this.userUuid = '',
    this.email = '',
    this.nickname = '',
    this.profileImageUrl = '',
    this.preferenceSet = false,
  });

  factory LocalLoginEntity.fromJson(Map<String, dynamic> json) =>
      _$LocalLoginEntityFromJson(json);

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
