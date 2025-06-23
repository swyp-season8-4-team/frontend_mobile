// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../apple_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppleRequestBody _$AppleRequestBodyFromJson(Map<String, dynamic> json) =>
    AppleRequestBody(
      code: json['code'] as String,
      state: json['state'] as String,
      id_token: json['id_token'] as String,
      user: UserAppleRequestBody.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppleRequestBodyToJson(AppleRequestBody instance) =>
    <String, dynamic>{
      'code': instance.code,
      'state': instance.state,
      'id_token': instance.id_token,
      'user': instance.user,
    };

UserAppleRequestBody _$UserAppleRequestBodyFromJson(
  Map<String, dynamic> json,
) => UserAppleRequestBody(
  email: json['email'] as String,
  name: NameAppleRequestBody.fromJson(json['name'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserAppleRequestBodyToJson(
  UserAppleRequestBody instance,
) => <String, dynamic>{'email': instance.email, 'name': instance.name};

NameAppleRequestBody _$NameAppleRequestBodyFromJson(
  Map<String, dynamic> json,
) => NameAppleRequestBody(
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
);

Map<String, dynamic> _$NameAppleRequestBodyToJson(
  NameAppleRequestBody instance,
) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
};
