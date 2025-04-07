// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../email_verify_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailVerifyModel _$EmailVerifyModelFromJson(Map<String, dynamic> json) =>
    EmailVerifyModel(
      verificationToken: json['verificationToken'] as String,
      verified: json['verified'] as bool,
    );

Map<String, dynamic> _$EmailVerifyModelToJson(EmailVerifyModel instance) =>
    <String, dynamic>{
      'verificationToken': instance.verificationToken,
      'verified': instance.verified,
    };
