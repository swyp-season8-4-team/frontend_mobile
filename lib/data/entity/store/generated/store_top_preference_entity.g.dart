// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../store_top_preference_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreTopPreferenceEntity _$StoreTopPreferenceEntityFromJson(
  Map<String, dynamic> json,
) => StoreTopPreferenceEntity(
  tagId: (json['tagId'] as num?)?.toInt() ?? -1,
  name: json['name'] as String? ?? '',
  rank: (json['rank'] as num?)?.toInt() ?? -1,
);

Map<String, dynamic> _$StoreTopPreferenceEntityToJson(
  StoreTopPreferenceEntity instance,
) => <String, dynamic>{
  'tagId': instance.tagId,
  'name': instance.name,
  'rank': instance.rank,
};
