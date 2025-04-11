// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_my_preferences_stores_by_location_query_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMyPreferencesStoresByLocationQueryParam
_$GetMyPreferencesStoresByLocationQueryParamFromJson(
  Map<String, dynamic> json,
) => GetMyPreferencesStoresByLocationQueryParam(
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  radius: (json['radius'] as num).toDouble(),
);

Map<String, dynamic> _$GetMyPreferencesStoresByLocationQueryParamToJson(
  GetMyPreferencesStoresByLocationQueryParam instance,
) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'radius': instance.radius,
};
