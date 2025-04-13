// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../mate_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MateDetailEntity _$MateDetailEntityFromJson(Map<String, dynamic> json) =>
    MateDetailEntity(
      mateUuid: json['mateUuid'] as String? ?? '',
      storeId: (json['storeId'] as num?)?.toInt() ?? -1,
      userUuid: json['userUuid'] as String? ?? '',
      nickname: json['nickname'] as String? ?? '',
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
      recruitYn: json['recruitYn'] as bool? ?? false,
      mateImage: json['mateImage'] as String? ?? '',
      profileImage: json['profileImage'] as String? ?? '',
      place:
          json['place'] == null
              ? const PlaceEntity()
              : PlaceEntity.fromJson(json['place'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
      saved: json['saved'] as bool? ?? false,
      applyStatus: json['applyStatus'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      mateCategory: json['mateCategory'] as String? ?? '',
    );

Map<String, dynamic> _$MateDetailEntityToJson(MateDetailEntity instance) =>
    <String, dynamic>{
      'mateUuid': instance.mateUuid,
      'storeId': instance.storeId,
      'userUuid': instance.userUuid,
      'nickname': instance.nickname,
      'title': instance.title,
      'content': instance.content,
      'recruitYn': instance.recruitYn,
      'mateImage': instance.mateImage,
      'profileImage': instance.profileImage,
      'place': instance.place,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'saved': instance.saved,
      'applyStatus': instance.applyStatus,
      'gender': instance.gender,
      'mateCategory': instance.mateCategory,
    };

PlaceEntity _$PlaceEntityFromJson(Map<String, dynamic> json) => PlaceEntity(
  placeName: json['placeName'] as String? ?? '',
  address: json['address'] as String? ?? '',
  latitude: (json['latitude'] as num?)?.toInt() ?? -1,
  longitude: (json['longitude'] as num?)?.toInt() ?? -1,
);

Map<String, dynamic> _$PlaceEntityToJson(PlaceEntity instance) =>
    <String, dynamic>{
      'placeName': instance.placeName,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
