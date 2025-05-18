// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../store_holiday_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreHolidayEntity _$StoreHolidayEntityFromJson(Map<String, dynamic> json) =>
    StoreHolidayEntity(
      startDate: json['startDate'] as String? ?? '',
      endDate: json['endDate'] as String? ?? '',
      reason: json['reason'] as String? ?? '',
    );

Map<String, dynamic> _$StoreHolidayEntityToJson(StoreHolidayEntity instance) =>
    <String, dynamic>{
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'reason': instance.reason,
    };
