// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_login_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalLoginEntity _$LocalLoginEntityFromJson(Map<String, dynamic> json) =>
    LocalLoginEntity(
      accessToken: json['accessToken'] as String? ?? '',
      refreshToken: json['refreshToken'] as String? ?? '',
      tokenType: json['tokenType'] as String? ?? '',
      expiresIn: (json['expiresIn'] as num?)?.toInt() ?? -1,
      userUuid: json['userUuid'] as String? ?? '',
      email: json['email'] as String? ?? '',
      nickname: json['nickname'] as String? ?? '',
      profileImageUrl: json['profileImageUrl'] as String? ?? '',
      preferenceSet: json['preferenceSet'] as bool? ?? false,
    );

Map<String, dynamic> _$LocalLoginEntityToJson(LocalLoginEntity instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'tokenType': instance.tokenType,
      'expiresIn': instance.expiresIn,
      'userUuid': instance.userUuid,
      'email': instance.email,
      'nickname': instance.nickname,
      'profileImageUrl': instance.profileImageUrl,
      'preferenceSet': instance.preferenceSet,
    };
