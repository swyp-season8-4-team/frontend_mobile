// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../patch_mate_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchMateRequestBody _$PatchMateRequestBodyFromJson(
  Map<String, dynamic> json,
) => PatchMateRequestBody(
  userUuid: json['userUuid'] as String,
  mateCategoryId: (json['mateCategoryId'] as num).toInt(),
  title: json['title'] as String,
  content: json['content'] as String,
  recruitYn: json['recruitYn'] as bool,
  capacity: (json['capacity'] as num?)?.toInt(),
  storeId: (json['storeId'] as num?)?.toInt(),
  place:
      json['place'] == null
          ? null
          : PlaceEntity.fromJson(json['place'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PatchMateRequestBodyToJson(
  PatchMateRequestBody instance,
) => <String, dynamic>{
  'userUuid': instance.userUuid,
  'mateCategoryId': instance.mateCategoryId,
  'title': instance.title,
  'content': instance.content,
  'recruitYn': instance.recruitYn,
  'capacity': instance.capacity,
  'storeId': instance.storeId,
  'place': instance.place,
};
