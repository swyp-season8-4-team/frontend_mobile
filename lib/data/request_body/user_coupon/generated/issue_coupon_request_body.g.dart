// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../issue_coupon_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueCouponRequestBody _$IssueCouponRequestBodyFromJson(
  Map<String, dynamic> json,
) => IssueCouponRequestBody(
  userUuid: json['userUuid'] as String,
  couponUuid: json['couponUuid'] as String,
);

Map<String, dynamic> _$IssueCouponRequestBodyToJson(
  IssueCouponRequestBody instance,
) => <String, dynamic>{
  'userUuid': instance.userUuid,
  'couponUuid': instance.couponUuid,
};
