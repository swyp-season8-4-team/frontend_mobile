// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../post_mate_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostMateRequestBody _$PostMateRequestBodyFromJson(Map<String, dynamic> json) =>
    PostMateRequestBody(
      userUuid: json['userUuid'] as String,
      mateCategoryId: (json['mateCategoryId'] as num).toInt(),
      capacity: (json['capacity'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      recruitYn: json['recruitYn'] as bool,
      storeId: (json['storeId'] as num?)?.toInt(),
      place:
          json['place'] == null
              ? null
              : PlaceEntity.fromJson(json['place'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostMateRequestBodyToJson(
  PostMateRequestBody instance,
) => <String, dynamic>{
  'userUuid': instance.userUuid,
  'mateCategoryId': instance.mateCategoryId,
  'capacity': instance.capacity,
  'title': instance.title,
  'content': instance.content,
  'recruitYn': instance.recruitYn,
  'storeId': instance.storeId,
  'place': instance.place,
};
