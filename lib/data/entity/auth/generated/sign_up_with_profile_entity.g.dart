// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../sign_up_with_profile_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpWithProfileEntity _$SignUpWithProfileEntityFromJson(
  Map<String, dynamic> json,
) => SignUpWithProfileEntity(
  accessToken: json['accessToken'] as String? ?? '',
  refreshToken: json['refreshToken'] as String? ?? '',
  tokenType: json['tokenType'] as String? ?? '',
  expiresIn: (json['expiresIn'] as num?)?.toInt() ?? -1,
  userUuid: json['userUuid'] as String? ?? '',
  email: json['email'] as String? ?? '',
  nickname: json['nickname'] as String? ?? '',
  profileImageUrl: json['profileImageUrl'] as String?,
  deviceId: json['deviceId'] as String? ?? '',
  imageError:
      json['imageError'] == null
          ? const ImageErrorEntity()
          : ImageErrorEntity.fromJson(
            json['imageError'] as Map<String, dynamic>,
          ),
  preferenceSet: json['preferenceSet'] as bool? ?? false,
);

Map<String, dynamic> _$SignUpWithProfileEntityToJson(
  SignUpWithProfileEntity instance,
) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
  'tokenType': instance.tokenType,
  'expiresIn': instance.expiresIn,
  'userUuid': instance.userUuid,
  'email': instance.email,
  'nickname': instance.nickname,
  'profileImageUrl': instance.profileImageUrl,
  'deviceId': instance.deviceId,
  'imageError': instance.imageError,
  'preferenceSet': instance.preferenceSet,
};

ImageErrorEntity _$ImageErrorEntityFromJson(Map<String, dynamic> json) =>
    ImageErrorEntity(
      status: (json['status'] as num?)?.toInt() ?? -1,
      code: json['code'] as String? ?? '',
      message: json['message'] as String? ?? '',
      timestamp: json['timestamp'] as String? ?? '',
    );

Map<String, dynamic> _$ImageErrorEntityToJson(ImageErrorEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'timestamp': instance.timestamp,
    };
