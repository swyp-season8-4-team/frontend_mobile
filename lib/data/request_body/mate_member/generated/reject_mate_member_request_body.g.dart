// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../reject_mate_member_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RejectMateMemberRequestBody _$RejectMateMemberRequestBodyFromJson(
  Map<String, dynamic> json,
) => RejectMateMemberRequestBody(
  creatorUserUuid: json['creatorUserUuid'] as String,
  rejectUserUuid: json['rejectUserUuid'] as String,
);

Map<String, dynamic> _$RejectMateMemberRequestBodyToJson(
  RejectMateMemberRequestBody instance,
) => <String, dynamic>{
  'creatorUserUuid': instance.creatorUserUuid,
  'rejectUserUuid': instance.rejectUserUuid,
};
