// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../post_mate_reply_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostMateReplyRequestBody _$PostMateReplyRequestBodyFromJson(
  Map<String, dynamic> json,
) => PostMateReplyRequestBody(
  userUuid: json['userUuid'] as String,
  content: json['content'] as String,
  parentMateReplyId: (json['parentMateReplyId'] as num?)?.toInt(),
);

Map<String, dynamic> _$PostMateReplyRequestBodyToJson(
  PostMateReplyRequestBody instance,
) => <String, dynamic>{
  'userUuid': instance.userUuid,
  'content': instance.content,
  if (instance.parentMateReplyId case final value?) 'parentMateReplyId': value,
};
