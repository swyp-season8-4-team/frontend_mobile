// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../patch_mate_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchMateParams _$PatchMateParamsFromJson(Map<String, dynamic> json) =>
    PatchMateParams(
      mateUuid: json['mateUuid'] as String,
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
              : PlaceModel.fromJson(json['place'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PatchMateParamsToJson(PatchMateParams instance) =>
    <String, dynamic>{
      'mateUuid': instance.mateUuid,
      'userUuid': instance.userUuid,
      'mateCategoryId': instance.mateCategoryId,
      'title': instance.title,
      'content': instance.content,
      'recruitYn': instance.recruitYn,
      'capacity': instance.capacity,
      'storeId': instance.storeId,
      'place': instance.place,
    };
