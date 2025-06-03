// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../token_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenInfo _$TokenInfoFromJson(Map<String, dynamic> json) => TokenInfo(
  startTime: DateTime.parse(json['startTime'] as String),
  accessToken: json['accessToken'] as String,
  expiresIn: (json['expiresIn'] as num).toInt(),
  deviceId: json['deviceId'] as String,
  refreshToken: json['refreshToken'] as String,
  refreshExpiresIn: (json['refreshExpiresIn'] as num).toInt(),
);

Map<String, dynamic> _$TokenInfoToJson(TokenInfo instance) => <String, dynamic>{
  'startTime': instance.startTime.toIso8601String(),
  'accessToken': instance.accessToken,
  'expiresIn': instance.expiresIn,
  'deviceId': instance.deviceId,
  'refreshToken': instance.refreshToken,
  'refreshExpiresIn': instance.refreshExpiresIn,
};
