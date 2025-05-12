// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_store_list_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserStoreListDetailEntity _$UserStoreListDetailEntityFromJson(
  Map<String, dynamic> json,
) => UserStoreListDetailEntity(
  listId: (json['listId'] as num?)?.toInt() ?? -1,
  userUuid: json['userUuid'] as String? ?? '',
  listName: json['listName'] as String? ?? '',
  iconColorId: (json['iconColorId'] as num?)?.toInt() ?? 1,
  storeCount: (json['storeCount'] as num?)?.toInt() ?? -1,
  storeData:
      (json['storeData'] as List<dynamic>?)
          ?.map(
            (e) =>
                UserStoreDataDetailEntity.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
);

Map<String, dynamic> _$UserStoreListDetailEntityToJson(
  UserStoreListDetailEntity instance,
) => <String, dynamic>{
  'listId': instance.listId,
  'userUuid': instance.userUuid,
  'listName': instance.listName,
  'iconColorId': instance.iconColorId,
  'storeCount': instance.storeCount,
  'storeData': instance.storeData,
};

UserStoreDataDetailEntity _$UserStoreDataDetailEntityFromJson(
  Map<String, dynamic> json,
) => UserStoreDataDetailEntity(
  userUuid: json['userUuid'] as String? ?? '',
  storeUuid: json['storeUuid'] as String? ?? '',
  listId: (json['listId'] as num?)?.toInt() ?? -1,
  listName: json['listName'] as String? ?? '',
  storeName: json['storeName'] as String? ?? '',
  storeAddress: json['storeAddress'] as String? ?? '',
  latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
  longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
  imageUrls:
      (json['imageUrls'] as List<dynamic>?)?.map((e) => e as String).toList(),
  userPreferences:
      (json['userPreferences'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
);

Map<String, dynamic> _$UserStoreDataDetailEntityToJson(
  UserStoreDataDetailEntity instance,
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
