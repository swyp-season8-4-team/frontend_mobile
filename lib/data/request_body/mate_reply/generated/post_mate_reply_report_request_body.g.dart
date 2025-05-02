// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../post_mate_reply_report_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostMateReplyReportRequestBody _$PostMateReplyReportRequestBodyFromJson(
  Map<String, dynamic> json,
) => PostMateReplyReportRequestBody(
  userUuid: json['userUuid'] as String,
  reportCategoryId: (json['reportCategoryId'] as num).toInt(),
  reportComment: json['reportComment'] as String?,
);

Map<String, dynamic> _$PostMateReplyReportRequestBodyToJson(
  PostMateReplyReportRequestBody instance,
) => <String, dynamic>{
  'userUuid': instance.userUuid,
  'reportCategoryId': instance.reportCategoryId,
  if (instance.reportComment case final value?) 'reportComment': value,
};
