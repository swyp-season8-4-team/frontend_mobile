// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../store_holiday_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreHolidayEntity _$StoreHolidayEntityFromJson(Map<String, dynamic> json) =>
    StoreHolidayEntity(
      date: json['date'] as String? ?? '',
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$StoreHolidayEntityToJson(StoreHolidayEntity instance) =>
    <String, dynamic>{'date': instance.date, 'reason': instance.reason};
