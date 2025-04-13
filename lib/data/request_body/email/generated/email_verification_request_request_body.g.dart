// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../email_verification_request_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailVerificationRequestRequestBody
_$EmailVerificationRequestRequestBodyFromJson(Map<String, dynamic> json) =>
    EmailVerificationRequestRequestBody(
      email: json['email'] as String,
      purpose: json['purpose'] as String,
    );

Map<String, dynamic> _$EmailVerificationRequestRequestBodyToJson(
  EmailVerificationRequestRequestBody instance,
) => <String, dynamic>{'email': instance.email, 'purpose': instance.purpose};
