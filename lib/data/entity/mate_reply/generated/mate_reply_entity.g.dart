// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../mate_reply_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MateReplyEntity _$MateReplyEntityFromJson(Map<String, dynamic> json) =>
    MateReplyEntity(
      mateUuid: json['mateUuid'] as String? ?? '',
      mateReplies:
          (json['mateReplies'] as List<dynamic>?)
              ?.map(
                (e) =>
                    MateReplyDetailEntity.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <MateReplyDetailEntity>[],
      count: (json['count'] as num?)?.toInt() ?? -1,
      last: json['last'] as bool? ?? false,
    );

Map<String, dynamic> _$MateReplyEntityToJson(MateReplyEntity instance) =>
    <String, dynamic>{
      'mateUuid': instance.mateUuid,
      'mateReplies': instance.mateReplies,
      'count': instance.count,
      'last': instance.last,
    };
