// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../email_verify_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailVerifyEntity _$EmailVerifyEntityFromJson(Map<String, dynamic> json) =>
    EmailVerifyEntity(
      verificationToken: json['verificationToken'] as String? ?? '',
      verified: json['verified'] as bool? ?? false,
    );

Map<String, dynamic> _$EmailVerifyEntityToJson(EmailVerifyEntity instance) =>
    <String, dynamic>{
      'verificationToken': instance.verificationToken,
      'verified': instance.verified,
    };
