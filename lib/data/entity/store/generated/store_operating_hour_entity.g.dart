// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../store_operating_hour_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreOperatingHourEntity _$StoreOperatingHourEntityFromJson(
  Map<String, dynamic> json,
) => StoreOperatingHourEntity(
  dayOfWeek: json['dayOfWeek'] as String,
  openingTime: json['openingTime'] as String,
  closingTime: json['closingTime'] as String,
  isClosed: json['isClosed'] as bool,
  lastOrderTime: json['lastOrderTime'] as String?,
  regularClosureType: json['regularClosureType'] as String?,
  regularClosureWeeks: json['regularClosureWeeks'] as String?,
  breakTimes:
      (json['breakTimes'] as List<dynamic>?)
          ?.map((e) => _BreakTime.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$StoreOperatingHourEntityToJson(
  StoreOperatingHourEntity instance,
) => <String, dynamic>{
  'dayOfWeek': instance.dayOfWeek,
  'openingTime': instance.openingTime,
  'closingTime': instance.closingTime,
  'lastOrderTime': instance.lastOrderTime,
  'isClosed': instance.isClosed,
  'regularClosureType': instance.regularClosureType,
  'regularClosureWeeks': instance.regularClosureWeeks,
  'breakTimes': instance.breakTimes,
};

_BreakTime _$BreakTimeFromJson(Map<String, dynamic> json) => _BreakTime(
  startTime: json['startTime'] as String,
  endTime: json['endTime'] as String,
);

Map<String, dynamic> _$BreakTimeToJson(_BreakTime instance) =>
    <String, dynamic>{
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
