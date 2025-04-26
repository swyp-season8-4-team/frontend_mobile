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
      if (instance.nickname case final value?) 'nickname': value,
      if (instance.preferences case final value?) 'preferences': value,
      if (instance.name case final value?) 'name': value,
      if (instance.phoneNumber case final value?) 'phoneNumber': value,
      if (instance.address case final value?) 'address': value,
      if (instance.gender case final value?) 'gender': value,
      if (instance.mbti case final value?) 'mbti': value,
    };
