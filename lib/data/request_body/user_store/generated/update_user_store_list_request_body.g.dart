// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../update_user_store_list_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserStoreListRequestBody _$UpdateUserStoreListRequestBodyFromJson(
  Map<String, dynamic> json,
) => UpdateUserStoreListRequestBody(
  selectedLists:
      (json['selectedLists'] as List<dynamic>)
          .map(
            (e) => UpdateUserStoreListSelectedList.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
);

Map<String, dynamic> _$UpdateUserStoreListRequestBodyToJson(
  UpdateUserStoreListRequestBody instance,
) => <String, dynamic>{'selectedLists': instance.selectedLists};

UpdateUserStoreListSelectedList _$UpdateUserStoreListSelectedListFromJson(
  Map<String, dynamic> json,
) => UpdateUserStoreListSelectedList(
  listId: (json['listId'] as num).toInt(),
  userPreferences:
      (json['userPreferences'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
);

Map<String, dynamic> _$UpdateUserStoreListSelectedListToJson(
  UpdateUserStoreListSelectedList instance,
) => <String, dynamic>{
  'listId': instance.listId,
  if (instance.userPreferences case final value?) 'userPreferences': value,
};
