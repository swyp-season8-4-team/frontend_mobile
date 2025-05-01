// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../accept_mate_member_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptMateMemberRequestBody _$AcceptMateMemberRequestBodyFromJson(
  Map<String, dynamic> json,
) => AcceptMateMemberRequestBody(
  creatorUserUuid: json['creatorUserUuid'] as String,
  acceptUserUuid: json['acceptUserUuid'] as String,
);

Map<String, dynamic> _$AcceptMateMemberRequestBodyToJson(
  AcceptMateMemberRequestBody instance,
) => <String, dynamic>{
  'creatorUserUuid': instance.creatorUserUuid,
  'acceptUserUuid': instance.acceptUserUuid,
};
