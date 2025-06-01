// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../password_reset_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordResetEntity _$PasswordResetEntityFromJson(Map<String, dynamic> json) =>
    PasswordResetEntity(
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$PasswordResetEntityToJson(
  PasswordResetEntity instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
};
