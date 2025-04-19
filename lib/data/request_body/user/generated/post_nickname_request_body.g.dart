// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../post_nickname_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostNicknameRequestBody _$PostNicknameRequestBodyFromJson(
  Map<String, dynamic> json,
) => PostNicknameRequestBody(
  nickname: json['nickname'] as String,
  purpose: json['purpose'] as String,
);

Map<String, dynamic> _$PostNicknameRequestBodyToJson(
  PostNicknameRequestBody instance,
) => <String, dynamic>{
  'nickname': instance.nickname,
  'purpose': instance.purpose,
};
