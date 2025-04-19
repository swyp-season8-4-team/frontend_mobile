// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../patch_me_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchMeRequestBody _$PatchMeRequestBodyFromJson(Map<String, dynamic> json) =>
    PatchMeRequestBody(
      nickname: json['nickname'] as String?,
      preferences:
          (json['preferences'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList(),
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      address: json['address'] as String?,
      gender: json['gender'] as String?,
      mbti: json['mbti'] as String?,
    );

Map<String, dynamic> _$PatchMeRequestBodyToJson(PatchMeRequestBody instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'preferences': instance.preferences,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'gender': instance.gender,
      'mbti': instance.mbti,
    };
