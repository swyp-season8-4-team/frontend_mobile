// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../post_mate_report_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostMateReportRequestBody _$PostMateReportRequestBodyFromJson(
  Map<String, dynamic> json,
) => PostMateReportRequestBody(
  userUuid: json['userUuid'] as String,
  reportCategoryId: (json['reportCategoryId'] as num).toInt(),
  reportComment: json['reportComment'] as String?,
);

Map<String, dynamic> _$PostMateReportRequestBodyToJson(
  PostMateReportRequestBody instance,
) => <String, dynamic>{
  'userUuid': instance.userUuid,
  'reportCategoryId': instance.reportCategoryId,
  if (instance.reportComment case final value?) 'reportComment': value,
};
