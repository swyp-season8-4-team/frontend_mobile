// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../search_popular_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularSearchesEntity _$PopularSearchesEntityFromJson(
  Map<String, dynamic> json,
) => PopularSearchesEntity(
  lastUpdatedTime: DateTime.parse(json['lastUpdatedTime'] as String),
  searches:
      (json['searches'] as List<dynamic>?)
          ?.map((e) => _PopularSearch.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$PopularSearchesEntityToJson(
  PopularSearchesEntity instance,
) => <String, dynamic>{
  'lastUpdatedTime': instance.lastUpdatedTime.toIso8601String(),
  'searches': instance.searches,
};

_PopularSearch _$PopularSearchFromJson(Map<String, dynamic> json) =>
    _PopularSearch(
      keyword: json['keyword'] as String,
      searchCount: (json['searchCount'] as num).toInt(),
      rank: (json['rank'] as num).toInt(),
      difference: (json['difference'] as num).toInt(),
    );

Map<String, dynamic> _$PopularSearchToJson(_PopularSearch instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'searchCount': instance.searchCount,
      'rank': instance.rank,
      'difference': instance.difference,
    };
