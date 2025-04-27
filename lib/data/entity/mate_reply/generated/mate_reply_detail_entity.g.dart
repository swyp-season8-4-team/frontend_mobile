// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../mate_reply_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MateReplyDetailEntity _$MateReplyDetailEntityFromJson(
  Map<String, dynamic> json,
) => MateReplyDetailEntity(
  mateReplyId: (json['mateReplyId'] as num?)?.toInt() ?? -1,
  mateUuid: json['mateUuid'] as String? ?? '',
  parentMateReplyId: (json['parentMateReplyId'] as num?)?.toInt(),
  userUuid: json['userUuid'] as String? ?? '',
  nickname: json['nickname'] as String? ?? '',
  content: json['content'] as String? ?? '',
  profileImage: json['profileImage'] as String? ?? '',
  gender: json['gender'] as String? ?? '',
  createdAt: json['createdAt'] as String? ?? '',
  updatedAt: json['updatedAt'] as String?,
  deletedAt: json['deletedAt'] as String?,
  children:
      (json['children'] as List<dynamic>?)
          ?.map(
            (e) => MateReplyDetailEntity.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <MateReplyDetailEntity>[],
);

Map<String, dynamic> _$MateReplyDetailEntityToJson(
  MateReplyDetailEntity instance,
) => <String, dynamic>{
  'mateReplyId': instance.mateReplyId,
  'mateUuid': instance.mateUuid,
  'parentMateReplyId': instance.parentMateReplyId,
  'userUuid': instance.userUuid,
  'nickname': instance.nickname,
  'content': instance.content,
  'profileImage': instance.profileImage,
  'gender': instance.gender,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'deletedAt': instance.deletedAt,
  'children': instance.children,
};
