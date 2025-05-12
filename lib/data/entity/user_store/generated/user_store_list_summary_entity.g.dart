// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_store_list_summary_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserStoreListSummaryEntity _$UserStoreListSummaryEntityFromJson(
  Map<String, dynamic> json,
) => UserStoreListSummaryEntity(
  listId: (json['listId'] as num?)?.toInt() ?? -1,
  listName: json['listName'] as String? ?? '',
  iconColorId: (json['iconColorId'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$UserStoreListSummaryEntityToJson(
  UserStoreListSummaryEntity instance,
) => <String, dynamic>{
  'listId': instance.listId,
  'listName': instance.listName,
  'iconColorId': instance.iconColorId,
};
