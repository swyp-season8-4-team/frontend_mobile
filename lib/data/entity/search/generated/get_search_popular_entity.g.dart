// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_search_popular_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSearchPopularEntity _$GetSearchPopularEntityFromJson(
  Map<String, dynamic> json,
) => GetSearchPopularEntity(
  keyword: json['keyword'] as String,
  searchCount: (json['searchCount'] as num).toInt(),
  rank: (json['rank'] as num).toInt(),
  difference: (json['difference'] as num).toInt(),
);

Map<String, dynamic> _$GetSearchPopularEntityToJson(
  GetSearchPopularEntity instance,
) => <String, dynamic>{
  'keyword': instance.keyword,
  'searchCount': instance.searchCount,
  'rank': instance.rank,
  'difference': instance.difference,
};
