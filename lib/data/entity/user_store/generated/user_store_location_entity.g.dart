// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_store_location_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserStoreLocationEntity _$UserStoreLocationEntityFromJson(
  Map<String, dynamic> json,
) => UserStoreLocationEntity(
  listId: (json['listId'] as num?)?.toInt() ?? -1,
  iconColorId: (json['iconColorId'] as num?)?.toInt() ?? 1,
  storeId: (json['storeId'] as num?)?.toInt() ?? -1,
  name: json['name'] as String? ?? '',
  latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
  longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
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
