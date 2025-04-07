// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../email_verification_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailVerificationRequestModel _$EmailVerificationRequestModelFromJson(
  Map<String, dynamic> json,
) => EmailVerificationRequestModel(
  message: json['message'] as String,
  expirationMinutes: (json['expirationMinutes'] as num).toInt(),
);

Map<String, dynamic> _$EmailVerificationRequestModelToJson(
  EmailVerificationRequestModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'expirationMinutes': instance.expirationMinutes,
};
