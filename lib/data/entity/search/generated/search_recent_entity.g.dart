// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../search_recent_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentSearchEntity _$RecentSearchEntityFromJson(Map<String, dynamic> json) =>
    RecentSearchEntity(
      id: (json['id'] as num).toInt(),
      keyword: json['keyword'] as String,
      createdAt: const DateTimeJsonConverter().fromJson(
        json['createdAt'] as String?,
      ),
    );

Map<String, dynamic> _$RecentSearchEntityToJson(RecentSearchEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'keyword': instance.keyword,
      'createdAt': const DateTimeJsonConverter().toJson(instance.createdAt),
    };
