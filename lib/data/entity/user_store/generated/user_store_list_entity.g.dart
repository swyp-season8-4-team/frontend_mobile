// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_store_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserStoreListEntity _$UserStoreListEntityFromJson(Map<String, dynamic> json) =>
    UserStoreListEntity(
      listId: (json['listId'] as num).toInt(),
      userUuid: json['userUuid'] as String,
      listName: json['listName'] as String,
      iconColorId: (json['iconColorId'] as num).toInt(),
      storeCount: (json['storeCount'] as num).toInt(),
      storeData:
          (json['storeData'] as List<dynamic>?)
              ?.map(
                (e) => UserStoreDataEntity.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );

Map<String, dynamic> _$UserStoreListEntityToJson(
  UserStoreListEntity instance,
) => <String, dynamic>{
  'listId': instance.listId,
  'userUuid': instance.userUuid,
  'listName': instance.listName,
  'iconColorId': instance.iconColorId,
  'storeCount': instance.storeCount,
  'storeData': instance.storeData,
};

UserStoreDataEntity _$UserStoreDataEntityFromJson(Map<String, dynamic> json) =>
    UserStoreDataEntity(
      listId: (json['listId'] as num).toInt(),
      iconColorId: (json['iconColorId'] as num).toInt(),
      storeId: (json['storeId'] as num).toInt(),
      storeUuid: json['storeUuid'] as String,
      name: json['name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$UserStoreDataEntityToJson(
  UserStoreDataEntity instance,
) => <String, dynamic>{
  'listId': instance.listId,
  'iconColorId': instance.iconColorId,
  'storeId': instance.storeId,
  'storeUuid': instance.storeUuid,
  'name': instance.name,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};
