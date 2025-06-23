import 'package:frontend_mobile/data/entity/common/image_error_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/kakao_entity.g.dart';

@JsonSerializable()
class KakaoEntity {
  const KakaoEntity({
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

  factory KakaoEntity.fromJson(Map<String, dynamic> json) =>
      _$KakaoEntityFromJson(json);

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
