// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_stores_by_location_query_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStoresByLocationQueryParam _$GetStoresByLocationQueryParamFromJson(
  Map<String, dynamic> json,
) => GetStoresByLocationQueryParam(
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  radius: (json['radius'] as num).toDouble(),
  preferenceTagIds:
      (json['preferenceTagIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
  searchKeyword: json['searchKeyword'] as String?,
);

Map<String, dynamic> _$GetStoresByLocationQueryParamToJson(
  GetStoresByLocationQueryParam instance,
) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'radius': instance.radius,
  if (instance.preferenceTagIds case final value?) 'preferenceTagIds': value,
  if (instance.searchKeyword case final value?) 'searchKeyword': value,
};
