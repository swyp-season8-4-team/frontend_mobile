import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/token_info.g.dart';

@JsonSerializable()
class TokenInfo {
  factory TokenInfo.fromJson(Map<String, dynamic> json) =>
      _$TokenInfoFromJson(json);

  const TokenInfo({
    required this.startTime,
    required this.accessToken,
    required this.expiresIn,
    required this.deviceId,
    required this.refreshToken,
    required this.refreshExpiresIn,
  });

  final DateTime startTime;
  final String accessToken;
  final int expiresIn;
  final String deviceId;
  final String refreshToken;
  final int refreshExpiresIn;

  Map<String, dynamic> toJson() => _$TokenInfoToJson(this);

  static String serialize({required TokenInfo tokenInfo}) =>
      jsonEncode(tokenInfo.toJson());

  static TokenInfo deserialize({required String json}) =>
      TokenInfo.fromJson(jsonDecode(json));
}
