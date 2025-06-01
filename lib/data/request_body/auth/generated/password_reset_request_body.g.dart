// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../password_reset_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordResetRequestBody _$PasswordResetRequestBodyFromJson(
  Map<String, dynamic> json,
) => PasswordResetRequestBody(
  email: json['email'] as String,
  currentPassword: json['currentPassword'] as String,
  newPassword: json['newPassword'] as String,
);

Map<String, dynamic> _$PasswordResetRequestBodyToJson(
  PasswordResetRequestBody instance,
) => <String, dynamic>{
  'email': instance.email,
  'currentPassword': instance.currentPassword,
  'newPassword': instance.newPassword,
};
