// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../refresh_token_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshTokenEntity _$RefreshTokenEntityFromJson(Map<String, dynamic> json) =>
    RefreshTokenEntity(
      accessToken: json['accessToken'] as String,
      tokenType: json['tokenType'] as String,
      expiresIn: (json['expiresIn'] as num).toInt(),
      deviceId: json['deviceId'] as String?,
    );

Map<String, dynamic> _$RefreshTokenEntityToJson(RefreshTokenEntity instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'tokenType': instance.tokenType,
      'expiresIn': instance.expiresIn,
      'deviceId': instance.deviceId,
    };
