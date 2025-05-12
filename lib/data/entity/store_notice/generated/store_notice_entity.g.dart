// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../store_notice_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreNoticeEntity _$StoreNoticeEntityFromJson(Map<String, dynamic> json) =>
    StoreNoticeEntity(
      createdAt: const DateTimeJsonConverter().fromJson(
        json['createdAt'] as String?,
      ),
      noticeId: (json['noticeId'] as num?)?.toInt() ?? -1,
      tag: json['tag'] as String? ?? '',
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
      updatedAt: const DateTimeJsonConverter().fromJson(
        json['updatedAt'] as String?,
      ),
    );

Map<String, dynamic> _$StoreNoticeEntityToJson(StoreNoticeEntity instance) =>
    <String, dynamic>{
      'noticeId': instance.noticeId,
      'tag': instance.tag,
      'title': instance.title,
      'content': instance.content,
      'createdAt': const DateTimeJsonConverter().toJson(instance.createdAt),
      'updatedAt': _$JsonConverterToJson<String?, DateTime>(
        instance.updatedAt,
        const DateTimeJsonConverter().toJson,
      ),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
