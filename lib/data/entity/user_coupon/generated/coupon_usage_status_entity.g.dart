// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../coupon_usage_status_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCouponUsageStatusEntity _$UserCouponUsageStatusEntityFromJson(
  Map<String, dynamic> json,
) => UserCouponUsageStatusEntity(
  usedCount: (json['usedCount'] as num).toInt(),
  unusedCount: (json['unusedCount'] as num).toInt(),
  expiredCount: (json['expiredCount'] as num).toInt(),
);

Map<String, dynamic> _$UserCouponUsageStatusEntityToJson(
  UserCouponUsageStatusEntity instance,
) => <String, dynamic>{
  'usedCount': instance.usedCount,
  'unusedCount': instance.unusedCount,
  'expiredCount': instance.expiredCount,
};
