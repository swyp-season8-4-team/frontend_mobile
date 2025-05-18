// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../block_user_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockUserRequestBody _$BlockUserRequestBodyFromJson(
  Map<String, dynamic> json,
) => BlockUserRequestBody(blockedUserUuid: json['blockedUserUuid'] as String?);

Map<String, dynamic> _$BlockUserRequestBodyToJson(
  BlockUserRequestBody instance,
) => <String, dynamic>{
  if (instance.blockedUserUuid case final value?) 'blockedUserUuid': value,
};
