// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../blocked_user_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockedUserListEntity _$BlockedUserListEntityFromJson(
  Map<String, dynamic> json,
) => BlockedUserListEntity(
  blockedUsers:
      (json['blockedUsers'] as List<dynamic>?)
          ?.map((e) => BlockedUserEntity.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <BlockedUserEntity>[],
  totalCount: (json['totalCount'] as num?)?.toInt() ?? -1,
);

Map<String, dynamic> _$BlockedUserListEntityToJson(
  BlockedUserListEntity instance,
) => <String, dynamic>{
  'blockedUsers': instance.blockedUsers,
  'totalCount': instance.totalCount,
};
