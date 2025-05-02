import 'package:json_annotation/json_annotation.dart';

part 'generated/sign_up_with_profile_entity.g.dart';

@JsonSerializable()
class SignUpWithProfileEntity {
  SignUpWithProfileEntity({
    this.accessToken = '',
    this.refreshToken = '',
    this.tokenType = '',
    this.expiresIn = -1,
    this.userUuid = '',
    this.email = '',
    this.nickname = '',
    this.profileImageUrl,
    this.deviceId = '',
    this.imageError = const ImageErrorEntity(),
    this.preferenceSet = false,
  });

  factory SignUpWithProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$SignUpWithProfileEntityFromJson(json);

  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int expiresIn;
  final String userUuid;
  final String email;
  final String nickname;
  final String? profileImageUrl;
  final String deviceId;
  final ImageErrorEntity? imageError;
  final bool preferenceSet;
}

@JsonSerializable()
class ImageErrorEntity {
  const ImageErrorEntity({
    this.status,
    this.code,
    this.message,
    this.timestamp,
  });

  factory ImageErrorEntity.fromJson(Map<String, dynamic> json) =>
      _$ImageErrorEntityFromJson(json);

  final int? status;
  final String? code;
  final String? message;
  final String? timestamp;
}
