// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../coupon_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponEntity _$CouponEntityFromJson(Map<String, dynamic> json) => CouponEntity(
  couponId: (json['couponId'] as num).toInt(),
  couponUuid: json['couponUuid'] as String,
  storeUuid: json['storeUuid'] as String,
  name: json['name'] as String,
  status: json['status'] as String,
  target: json['target'] as String,
  hasExposureDate: json['hasExposureDate'] as bool,
  hasExpiryDate: json['hasExpiryDate'] as bool,
  hasQuantity: json['hasQuantity'] as bool,
  couponType: CouponTypeEntity.fromJson(
    json['couponType'] as Map<String, dynamic>,
  ),
  condition: CouponConditionEntity.fromJson(
    json['condition'] as Map<String, dynamic>,
  ),
  createdAt: DateTime.parse(json['createdAt'] as String),
  exposureStartAt:
      json['exposureStartAt'] == null
          ? null
          : DateTime.parse(json['exposureStartAt'] as String),
  exposureEndAt:
      json['exposureEndAt'] == null
          ? null
          : DateTime.parse(json['exposureEndAt'] as String),
  expiryDate:
      json['expiryDate'] == null
          ? null
          : DateTime.parse(json['expiryDate'] as String),
  quantity: (json['quantity'] as num?)?.toInt(),
);

Map<String, dynamic> _$CouponEntityToJson(CouponEntity instance) =>
    <String, dynamic>{
      'couponId': instance.couponId,
      'couponUuid': instance.couponUuid,
      'storeUuid': instance.storeUuid,
      'name': instance.name,
      'status': instance.status,
      'target': instance.target,
      'hasExposureDate': instance.hasExposureDate,
      'exposureStartAt': instance.exposureStartAt?.toIso8601String(),
      'exposureEndAt': instance.exposureEndAt?.toIso8601String(),
      'hasExpiryDate': instance.hasExpiryDate,
      'expiryDate': instance.expiryDate?.toIso8601String(),
      'hasQuantity': instance.hasQuantity,
      'quantity': instance.quantity,
      'couponType': instance.couponType,
      'condition': instance.condition,
      'createdAt': instance.createdAt.toIso8601String(),
    };

CouponTypeEntity _$CouponTypeEntityFromJson(Map<String, dynamic> json) =>
    CouponTypeEntity(
      type: json['type'] as String,
      discountType: json['discountType'] as String,
      discountAmount: (json['discountAmount'] as num).toInt(),
    );

Map<String, dynamic> _$CouponTypeEntityToJson(CouponTypeEntity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'discountType': instance.discountType,
      'discountAmount': instance.discountAmount,
    };

CouponConditionEntity _$CouponConditionEntityFromJson(
  Map<String, dynamic> json,
) => CouponConditionEntity(
  conditionType: json['conditionType'] as String,
  minimumPurchaseAmount: (json['minimumPurchaseAmount'] as num).toInt(),
);

Map<String, dynamic> _$CouponConditionEntityToJson(
  CouponConditionEntity instance,
) => <String, dynamic>{
  'conditionType': instance.conditionType,
  'minimumPurchaseAmount': instance.minimumPurchaseAmount,
};
