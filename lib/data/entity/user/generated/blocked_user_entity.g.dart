// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../blocked_user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockedUserEntity _$BlockedUserEntityFromJson(Map<String, dynamic> json) =>
    BlockedUserEntity(
      createdAt: const DateTimeJsonConverter().fromJson(
        json['createdAt'] as String?,
      ),
      id: (json['id'] as num?)?.toInt() ?? -1,
      blockerUserUuid: json['blockerUserUuid'] as String? ?? '',
      blockedUserUuid: json['blockedUserUuid'] as String? ?? '',
      blockedUserNickname: json['blockedUserNickname'] as String? ?? '',
      blocked: json['blocked'] as bool? ?? false,
    );

Map<String, dynamic> _$BlockedUserEntityToJson(BlockedUserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'blockerUserUuid': instance.blockerUserUuid,
      'blockedUserUuid': instance.blockedUserUuid,
      'blockedUserNickname': instance.blockedUserNickname,
      'createdAt': const DateTimeJsonConverter().toJson(instance.createdAt),
      'blocked': instance.blocked,
    };
