// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../kakao_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KakaoRequestBody _$KakaoRequestBodyFromJson(Map<String, dynamic> json) =>
    KakaoRequestBody(
      code: json['code'] as String,
      provider: json['provider'] as String,
    );

Map<String, dynamic> _$KakaoRequestBodyToJson(KakaoRequestBody instance) =>
    <String, dynamic>{'code': instance.code, 'provider': instance.provider};
