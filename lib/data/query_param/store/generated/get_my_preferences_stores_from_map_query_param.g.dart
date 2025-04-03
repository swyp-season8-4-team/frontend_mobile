// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_my_preferences_stores_from_map_query_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMyPreferencesStoresFromMapQueryParam
_$GetMyPreferencesStoresFromMapQueryParamFromJson(Map<String, dynamic> json) =>
    GetMyPreferencesStoresFromMapQueryParam(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      radius: (json['radius'] as num).toDouble(),
    );

Map<String, dynamic> _$GetMyPreferencesStoresFromMapQueryParamToJson(
  GetMyPreferencesStoresFromMapQueryParam instance,
) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'radius': instance.radius,
};
