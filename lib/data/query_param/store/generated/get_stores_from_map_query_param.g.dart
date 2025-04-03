// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_stores_from_map_query_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStoresFromMapQueryParam _$GetStoresFromMapQueryParamFromJson(
  Map<String, dynamic> json,
) => GetStoresFromMapQueryParam(
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  radius: (json['radius'] as num).toDouble(),
  preferenceTagIds:
      (json['preferenceTagIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
  searchKeyword: json['searchKeyword'] as String?,
);

Map<String, dynamic> _$GetStoresFromMapQueryParamToJson(
  GetStoresFromMapQueryParam instance,
) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'radius': instance.radius,
  'preferenceTagIds': instance.preferenceTagIds,
  'searchKeyword': instance.searchKeyword,
};
