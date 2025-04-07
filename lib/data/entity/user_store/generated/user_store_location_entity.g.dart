// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_store_location_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserStoreLocationEntity _$UserStoreLocationEntityFromJson(
  Map<String, dynamic> json,
) => UserStoreLocationEntity(
  listId: (json['listId'] as num).toInt(),
  iconColorId: (json['iconColorId'] as num).toInt(),
  storeId: (json['storeId'] as num).toInt(),
  name: json['name'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
);

Map<String, dynamic> _$UserStoreLocationEntityToJson(
  UserStoreLocationEntity instance,
) => <String, dynamic>{
  'listId': instance.listId,
  'iconColorId': instance.iconColorId,
  'storeId': instance.storeId,
  'name': instance.name,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};
