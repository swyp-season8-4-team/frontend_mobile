// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../search_recent_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentSearchEntity _$RecentSearchEntityFromJson(Map<String, dynamic> json) =>
    RecentSearchEntity(
      createdAt: const DateTimeJsonConverter().fromJson(
        json['createdAt'] as String?,
      ),
      id: (json['id'] as num?)?.toInt() ?? -1,
      keyword: json['keyword'] as String? ?? '',
    );

Map<String, dynamic> _$RecentSearchEntityToJson(RecentSearchEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'keyword': instance.keyword,
      'createdAt': const DateTimeJsonConverter().toJson(instance.createdAt),
    };
