// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../apple_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppleEntity _$AppleEntityFromJson(Map<String, dynamic> json) => AppleEntity(
  accessToken: json['accessToken'] as String? ?? '',
  refreshToken: json['refreshToken'] as String? ?? '',
  tokenType: json['tokenType'] as String? ?? '',
  refreshExpiresIn: (json['refreshExpiresIn'] as num?)?.toInt() ?? -1,
  expiresIn: (json['expiresIn'] as num?)?.toInt() ?? -1,
  userUuid: json['userUuid'] as String? ?? '',
  email: json['email'] as String? ?? '',
  nickname: json['nickname'] as String? ?? '',
  profileImageUrl: json['profileImageUrl'] as String?,
  deviceId: json['deviceId'] as String? ?? '',
  fromApp: json['fromApp'] as bool? ?? false,
  imageError:
      json['imageError'] == null
          ? const ImageErrorEntity()
          : ImageErrorEntity.fromJson(
            json['imageError'] as Map<String, dynamic>,
          ),
  preferenceSet: json['preferenceSet'] as bool? ?? false,
);

Map<String, dynamic> _$AppleEntityToJson(AppleEntity instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'tokenType': instance.tokenType,
      'refreshExpiresIn': instance.refreshExpiresIn,
      'expiresIn': instance.expiresIn,
      'userUuid': instance.userUuid,
      'email': instance.email,
      'nickname': instance.nickname,
      'profileImageUrl': instance.profileImageUrl,
      'deviceId': instance.deviceId,
      'fromApp': instance.fromApp,
      'imageError': instance.imageError,
      'preferenceSet': instance.preferenceSet,
    };
