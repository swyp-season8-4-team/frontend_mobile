import 'package:json_annotation/json_annotation.dart';

part 'generated/refresh_token_entity.g.dart';

@JsonSerializable()
class RefreshTokenEntity {
  const RefreshTokenEntity({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    this.deviceId,
  });

  factory RefreshTokenEntity.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenEntityFromJson(json);

  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final String? deviceId;
}
