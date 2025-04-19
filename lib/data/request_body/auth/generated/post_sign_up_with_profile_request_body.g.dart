// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../post_sign_up_with_profile_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostSignUpWithProfileRequestBody _$PostSignUpWithProfileRequestBodyFromJson(
  Map<String, dynamic> json,
) => PostSignUpWithProfileRequestBody(
  email: json['email'] as String,
  password: json['password'] as String,
  confirmPassword: json['confirmPassword'] as String,
  nickname: json['nickname'] as String,
  name: json['name'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  address: json['address'] as String?,
  gender: json['gender'] as String?,
  preferenceIds:
      (json['preferenceIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
  role: json['role'] as String?,
);

Map<String, dynamic> _$PostSignUpWithProfileRequestBodyToJson(
  PostSignUpWithProfileRequestBody instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'confirmPassword': instance.confirmPassword,
  'nickname': instance.nickname,
  'name': instance.name,
  'phoneNumber': instance.phoneNumber,
  'address': instance.address,
  'gender': instance.gender,
  'preferenceIds': instance.preferenceIds,
  'role': instance.role,
};
