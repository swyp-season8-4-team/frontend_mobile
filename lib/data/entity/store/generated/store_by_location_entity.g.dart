// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../store_by_location_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreByLocationEntity _$StoreByLocationEntityFromJson(
  Map<String, dynamic> json,
) => StoreByLocationEntity(
  storeId: (json['storeId'] as num?)?.toInt() ?? -1,
  storeUuid: json['storeUuid'] as String? ?? '',
  name: json['name'] as String? ?? '',
  address: json['address'] as String? ?? '',
  latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
  longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
  operatingHours:
      (json['operatingHours'] as List<dynamic>?)
          ?.map(
            (e) => StoreOperatingHourEntity.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <StoreOperatingHourEntity>[],
  shortReviewCount: (json['shortReviewCount'] as num?)?.toInt() ?? -1,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  storeImage: json['storeImage'] as String?,
  holidays:
      (json['holidays'] as List<dynamic>?)
          ?.map((e) => StoreHolidayEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$StoreByLocationEntityToJson(
  StoreByLocationEntity instance,
) => <String, dynamic>{
  'storeId': instance.storeId,
  'storeUuid': instance.storeUuid,
  'name': instance.name,
  'address': instance.address,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'operatingHours': instance.operatingHours,
  'holidays': instance.holidays,
  'shortReviewCount': instance.shortReviewCount,
  'tags': instance.tags,
  'storeImage': instance.storeImage,
};
