// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../email_verify_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailVerifyRequestBody _$EmailVerifyRequestBodyFromJson(
  Map<String, dynamic> json,
) => EmailVerifyRequestBody(
  email: json['email'] as String,
  code: json['code'] as String,
  purpose: json['purpose'] as String,
);

Map<String, dynamic> _$EmailVerifyRequestBodyToJson(
  EmailVerifyRequestBody instance,
) => <String, dynamic>{
  'email': instance.email,
  'code': instance.code,
  'purpose': instance.purpose,
};
