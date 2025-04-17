// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../store_notice_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreNoticeEntity _$StoreNoticeEntityFromJson(Map<String, dynamic> json) =>
    StoreNoticeEntity(
      noticeId: (json['noticeId'] as num).toInt(),
      tag: json['tag'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt:
          json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$StoreNoticeEntityToJson(StoreNoticeEntity instance) =>
    <String, dynamic>{
      'noticeId': instance.noticeId,
      'tag': instance.tag,
      'title': instance.title,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
