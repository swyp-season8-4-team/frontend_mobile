// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailEntity _$UserDetailEntityFromJson(Map<String, dynamic> json) =>
    UserDetailEntity(
      userUuid: json['userUuid'] as String? ?? '',
      nickname: json['nickname'] as String? ?? '',
      gender: json['gender'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      preferences:
          (json['preferences'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const <int>[],
      mbti: json['mbti'] as String?,
      email: json['email'] as String? ?? '',
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      address: json['address'] as String?,
      isPreferencesSet: json['isPreferencesSet'] as bool? ?? false,
    );

Map<String, dynamic> _$UserDetailEntityToJson(UserDetailEntity instance) =>
    <String, dynamic>{
      'userUuid': instance.userUuid,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'profileImageUrl': instance.profileImageUrl,
      'preferences': instance.preferences,
      'mbti': instance.mbti,
      'email': instance.email,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'isPreferencesSet': instance.isPreferencesSet,
    };
