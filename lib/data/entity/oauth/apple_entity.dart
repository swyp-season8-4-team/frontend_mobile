import 'package:frontend_mobile/data/entity/common/image_error_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/apple_entity.g.dart';

@JsonSerializable()
class AppleEntity {
  const AppleEntity({
    this.accessToken = '',
    this.refreshToken = '',
    this.tokenType = '',
    this.refreshExpiresIn = -1,
    this.expiresIn = -1,
    this.userUuid = '',
    this.email = '',
    this.nickname = '',
    this.profileImageUrl,
    this.deviceId = '',
    this.fromApp = false,
    this.imageError = const ImageErrorEntity(),
    this.preferenceSet = false,
  });

  factory AppleEntity.fromJson(Map<String, dynamic> json) =>
      _$AppleEntityFromJson(json);

  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int refreshExpiresIn;
  final int expiresIn;
  final String userUuid;
  final String email;
  final String nickname;
  final String? profileImageUrl;
  final String deviceId;
  final bool fromApp;
  final ImageErrorEntity? imageError;
  final bool preferenceSet;
}
