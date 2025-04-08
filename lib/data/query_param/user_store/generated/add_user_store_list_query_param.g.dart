// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../add_user_store_list_query_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddUserStoreListQueryParam _$AddUserStoreListQueryParamFromJson(
  Map<String, dynamic> json,
) => AddUserStoreListQueryParam(
  listName: json['listName'] as String,
  iconColorId: (json['iconColorId'] as num).toInt(),
);

Map<String, dynamic> _$AddUserStoreListQueryParamToJson(
  AddUserStoreListQueryParam instance,
) => <String, dynamic>{
  'listName': instance.listName,
  'iconColorId': instance.iconColorId,
};
