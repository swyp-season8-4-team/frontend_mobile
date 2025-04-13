import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/token_info.g.dart';

@JsonSerializable()
class TokenInfo {
  factory TokenInfo.fromJson(Map<String, dynamic> json) =>
      _$TokenInfoFromJson(json);

  TokenInfo({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
    required this.deviceId,
  });

  final String accessToken;
  final String refreshToken;
  final int expiresIn;
  final String deviceId;

  Map<String, dynamic> toJson() => _$TokenInfoToJson(this);

  static String serialize({required TokenInfo tokenInfo}) =>
      jsonEncode(tokenInfo.toJson());

  static TokenInfo deserialize({required String json}) =>
      TokenInfo.fromJson(jsonDecode(json));
}
