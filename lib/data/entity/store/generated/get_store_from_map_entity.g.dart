// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_store_from_map_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStoreFromMapEntity _$GetStoreFromMapEntityFromJson(
  Map<String, dynamic> json,
) => GetStoreFromMapEntity(
  storeId: (json['storeId'] as num).toInt(),
  storeUuid: json['storeUuid'] as String,
  name: json['name'] as String,
  address: json['address'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  operatingHours:
      (json['operatingHours'] as List<dynamic>)
          .map(
            (e) =>
                GetStoreOperatingHourEntity.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  shortReviewCount: (json['shortReviewCount'] as num).toInt(),
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  storeImage: json['storeImage'] as String,
);

Map<String, dynamic> _$GetStoreFromMapEntityToJson(
  GetStoreFromMapEntity instance,
) => <String, dynamic>{
  'storeId': instance.storeId,
  'storeUuid': instance.storeUuid,
  'name': instance.name,
  'address': instance.address,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'operatingHours': instance.operatingHours,
  'shortReviewCount': instance.shortReviewCount,
  'tags': instance.tags,
  'storeImage': instance.storeImage,
};
