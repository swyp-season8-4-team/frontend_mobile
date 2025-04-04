// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_user_store_list_summary_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserStoreListSummaryEntity _$GetUserStoreListSummaryEntityFromJson(
  Map<String, dynamic> json,
) => GetUserStoreListSummaryEntity(
  listId: (json['listId'] as num).toInt(),
  listName: json['listName'] as String,
  iconColorId: (json['iconColorId'] as num).toInt(),
);

Map<String, dynamic> _$GetUserStoreListSummaryEntityToJson(
  GetUserStoreListSummaryEntity instance,
) => <String, dynamic>{
  'listId': instance.listId,
  'listName': instance.listName,
  'iconColorId': instance.iconColorId,
};
