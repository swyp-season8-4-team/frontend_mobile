// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../store_summary_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreSummaryEntity _$StoreSummaryEntityFromJson(
  Map<String, dynamic> json,
) => StoreSummaryEntity(
  storeId: (json['storeId'] as num).toInt(),
  storeUuid: json['storeUuid'] as String,
  name: json['name'] as String,
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  operatingHours:
      (json['operatingHours'] as List<dynamic>)
          .map(
            (e) => StoreOperatingHourEntity.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  address: json['address'] as String,
  phone: json['phone'] as String,
  averageRating: (json['averageRating'] as num?)?.toDouble(),
  storeImages:
      (json['storeImages'] as List<dynamic>?)?.map((e) => e as String).toList(),
  ownerPickImages:
      (json['ownerPickImages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  primaryStoreLink: json['primaryStoreLink'] as String?,
  storeLinks:
      (json['storeLinks'] as List<dynamic>?)?.map((e) => e as String).toList(),
  holidays:
      (json['holidays'] as List<dynamic>?)
          ?.map((e) => StoreHolidayEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
  topPreferences:
      (json['topPreferences'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  description: json['description'] as String?,
  animalYn: json['animalYn'] as bool?,
  tumblerYn: json['tumblerYn'] as bool?,
  parkingYn: json['parkingYn'] as bool?,
);

Map<String, dynamic> _$StoreSummaryEntityToJson(StoreSummaryEntity instance) =>
    <String, dynamic>{
      'storeId': instance.storeId,
      'storeUuid': instance.storeUuid,
      'name': instance.name,
      'averageRating': instance.averageRating,
      'storeImages': instance.storeImages,
      'ownerPickImages': instance.ownerPickImages,
      'tags': instance.tags,
      'primaryStoreLink': instance.primaryStoreLink,
      'storeLinks': instance.storeLinks,
      'operatingHours': instance.operatingHours,
      'holidays': instance.holidays,
      'topPreferences': instance.topPreferences,
      'address': instance.address,
      'phone': instance.phone,
      'description': instance.description,
      'animalYn': instance.animalYn,
      'tumblerYn': instance.tumblerYn,
      'parkingYn': instance.parkingYn,
    };
