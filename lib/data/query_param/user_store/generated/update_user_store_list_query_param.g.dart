// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../update_user_store_list_query_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserStoreListQueryParam _$UpdateUserStoreListQueryParamFromJson(
  Map<String, dynamic> json,
) => UpdateUserStoreListQueryParam(
  newName: json['newName'] as String,
  newIconColorId: (json['newIconColorId'] as num).toInt(),
);

Map<String, dynamic> _$UpdateUserStoreListQueryParamToJson(
  UpdateUserStoreListQueryParam instance,
) => <String, dynamic>{
  'newName': instance.newName,
  'newIconColorId': instance.newIconColorId,
};
