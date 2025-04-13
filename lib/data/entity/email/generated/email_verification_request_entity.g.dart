// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../email_verification_request_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailVerificationRequestEntity _$EmailVerificationRequestEntityFromJson(
  Map<String, dynamic> json,
) => EmailVerificationRequestEntity(
  message: json['message'] as String? ?? '',
  expirationMinutes: (json['expirationMinutes'] as num?)?.toInt() ?? -1,
);

Map<String, dynamic> _$EmailVerificationRequestEntityToJson(
  EmailVerificationRequestEntity instance,
) => <String, dynamic>{
  'message': instance.message,
  'expirationMinutes': instance.expirationMinutes,
};
