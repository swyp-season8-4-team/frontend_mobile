// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_search_recent_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSearchRecentEntity _$GetSearchRecentEntityFromJson(
  Map<String, dynamic> json,
) => GetSearchRecentEntity(
  id: (json['id'] as num).toInt(),
  keyword: json['keyword'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$GetSearchRecentEntityToJson(
  GetSearchRecentEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'keyword': instance.keyword,
  'createdAt': instance.createdAt.toIso8601String(),
};
