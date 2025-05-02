// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../ban_mate_member_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BanMateMemberRequestBody _$BanMateMemberRequestBodyFromJson(
  Map<String, dynamic> json,
) => BanMateMemberRequestBody(
  creatorUserUuid: json['creatorUserUuid'] as String,
  banUserUuid: json['banUserUuid'] as String,
);

Map<String, dynamic> _$BanMateMemberRequestBodyToJson(
  BanMateMemberRequestBody instance,
) => <String, dynamic>{
  'creatorUserUuid': instance.creatorUserUuid,
  'banUserUuid': instance.banUserUuid,
};
