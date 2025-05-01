// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../coupon_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponEntity _$CouponEntityFromJson(Map<String, dynamic> json) => CouponEntity(
  couponType: CouponTypeEntity.fromJson(
    json['couponType'] as Map<String, dynamic>,
  ),
  condition: CouponConditionEntity.fromJson(
    json['condition'] as Map<String, dynamic>,
  ),
  createdAt: const DateTimeJsonConverter().fromJson(
    json['createdAt'] as String?,
  ),
  couponId: (json['couponId'] as num?)?.toInt() ?? -1,
  couponUuid: json['couponUuid'] as String? ?? '',
  storeUuid: json['storeUuid'] as String? ?? '',
  name: json['name'] as String? ?? '',
  status: json['status'] as String? ?? '',
  target: json['target'] as String? ?? '',
  hasExposureDate: json['hasExposureDate'] as bool? ?? false,
  exposureStartAt: const DateTimeJsonConverter().fromJson(
    json['exposureStartAt'] as String?,
  ),
  exposureEndAt: const DateTimeJsonConverter().fromJson(
    json['exposureEndAt'] as String?,
  ),
  hasExpiryDate: json['hasExpiryDate'] as bool? ?? false,
  expiryDate: const DateTimeJsonConverter().fromJson(
    json['expiryDate'] as String?,
  ),
  hasQuantity: json['hasQuantity'] as bool? ?? false,
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
      'exposureStartAt': _$JsonConverterToJson<String?, DateTime>(
        instance.exposureStartAt,
        const DateTimeJsonConverter().toJson,
      ),
      'exposureEndAt': _$JsonConverterToJson<String?, DateTime>(
        instance.exposureEndAt,
        const DateTimeJsonConverter().toJson,
      ),
      'hasExpiryDate': instance.hasExpiryDate,
      'expiryDate': _$JsonConverterToJson<String?, DateTime>(
        instance.expiryDate,
        const DateTimeJsonConverter().toJson,
      ),
      'hasQuantity': instance.hasQuantity,
      'quantity': instance.quantity,
      'couponType': instance.couponType,
      'condition': instance.condition,
      'createdAt': const DateTimeJsonConverter().toJson(instance.createdAt),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

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
