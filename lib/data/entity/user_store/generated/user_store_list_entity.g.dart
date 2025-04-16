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
      userUuid: json['userUuid'] as String,
      storeUuid: json['storeUuid'] as String,
      listId: (json['listId'] as num).toInt(),
      listName: json['listName'] as String,
      storeName: json['storeName'] as String,
      storeAddress: json['storeAddress'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      imageUrls:
          (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      userPreferences:
          (json['userPreferences'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList(),
    );

Map<String, dynamic> _$UserStoreDataEntityToJson(
  UserStoreDataEntity instance,
) => <String, dynamic>{
  'userUuid': instance.userUuid,
  'storeUuid': instance.storeUuid,
  'listId': instance.listId,
  'listName': instance.listName,
  'storeName': instance.storeName,
  'storeAddress': instance.storeAddress,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'imageUrls': instance.imageUrls,
  'userPreferences': instance.userPreferences,
};
