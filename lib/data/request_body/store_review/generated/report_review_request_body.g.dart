// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../report_review_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportReviewRequestBody _$ReportReviewRequestBodyFromJson(
  Map<String, dynamic> json,
) => ReportReviewRequestBody(
  userUuid: json['userUuid'] as String,
  reportCategoryId: (json['reportCategoryId'] as num).toInt(),
  reportComment: json['reportComment'] as String?,
);

Map<String, dynamic> _$ReportReviewRequestBodyToJson(
  ReportReviewRequestBody instance,
) => <String, dynamic>{
  'userUuid': instance.userUuid,
  'reportCategoryId': instance.reportCategoryId,
  if (instance.reportComment case final value?) 'reportComment': value,
};
