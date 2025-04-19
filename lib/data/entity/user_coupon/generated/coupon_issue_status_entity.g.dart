// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../coupon_issue_status_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponIssueStatusEntity _$CouponIssueStatusEntityFromJson(
  Map<String, dynamic> json,
) => CouponIssueStatusEntity(
  couponId: (json['couponId'] as num).toInt(),
  couponName: json['couponName'] as String,
  issued: json['issued'] as bool,
);

Map<String, dynamic> _$CouponIssueStatusEntityToJson(
  CouponIssueStatusEntity instance,
) => <String, dynamic>{
  'couponId': instance.couponId,
  'couponName': instance.couponName,
  'issued': instance.issued,
};
