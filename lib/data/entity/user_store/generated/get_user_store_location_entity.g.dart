// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_user_store_location_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserStoreLocationEntity _$GetUserStoreLocationEntityFromJson(
  Map<String, dynamic> json,
) => GetUserStoreLocationEntity(
  listId: (json['listId'] as num).toInt(),
  iconColorId: (json['iconColorId'] as num).toInt(),
  storeId: (json['storeId'] as num).toInt(),
  name: json['name'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
);

Map<String, dynamic> _$GetUserStoreLocationEntityToJson(
  GetUserStoreLocationEntity instance,
) => <String, dynamic>{
  'listId': instance.listId,
  'iconColorId': instance.iconColorId,
  'storeId': instance.storeId,
  'name': instance.name,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};
