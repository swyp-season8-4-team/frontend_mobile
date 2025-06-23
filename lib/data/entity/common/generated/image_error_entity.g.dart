// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../image_error_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageErrorEntity _$ImageErrorEntityFromJson(Map<String, dynamic> json) =>
    ImageErrorEntity(
      status: (json['status'] as num?)?.toInt(),
      code: json['code'] as String?,
      message: json['message'] as String?,
      timestamp: json['timestamp'] as String?,
    );

Map<String, dynamic> _$ImageErrorEntityToJson(ImageErrorEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'timestamp': instance.timestamp,
    };
