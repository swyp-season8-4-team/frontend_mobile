// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exception_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExceptionModel _$ExceptionModelFromJson(Map<String, dynamic> json) =>
    ExceptionModel(
      status: (json['status'] as num).toInt(),
      code: json['code'] as String,
      message: json['message'] as String,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$ExceptionModelToJson(ExceptionModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'timestamp': instance.timestamp,
    };
