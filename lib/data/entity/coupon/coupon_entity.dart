import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coupon_entity.g.dart';

@JsonSerializable()
class CouponEntity {
  const CouponEntity({
    required this.couponId,
    required this.couponUuid,
    required this.storeUuid,
    required this.name,
    required this.status,
    required this.target,
    required this.hasExposureDate,
    required this.hasExpiryDate,
    required this.hasQuantity,
    required this.couponType,
    required this.condition,
    required this.createdAt,
    this.exposureStartAt,
    this.exposureEndAt,
    this.expiryDate,
    this.quantity,
  });

  factory CouponEntity.fromJson(Map<String, dynamic> json) =>
      _$CouponEntityFromJson(json);
  final int couponId;
  final String couponUuid;
  final String storeUuid;
  final String name;
  final String status;
  final String target;
  final bool hasExposureDate;
  final DateTime? exposureStartAt;
  final DateTime? exposureEndAt;
  final bool hasExpiryDate;
  final DateTime? expiryDate;
  final bool hasQuantity;
  final int? quantity;
  final CouponTypeEntity couponType;
  final CouponConditionEntity condition;
  final DateTime createdAt;
}

@JsonSerializable()
class CouponTypeEntity {
  const CouponTypeEntity({
    required this.type,
    required this.discountType,
    required this.discountAmount,
  });

  factory CouponTypeEntity.fromJson(Map<String, dynamic> json) =>
      _$CouponTypeEntityFromJson(json);
  final String type;
  final String discountType;
  final int discountAmount;
}

@JsonSerializable()
class CouponConditionEntity {
  const CouponConditionEntity({
    required this.conditionType,
    required this.minimumPurchaseAmount,
  });

  factory CouponConditionEntity.fromJson(Map<String, dynamic> json) =>
      _$CouponConditionEntityFromJson(json);
  final String conditionType;
  final int minimumPurchaseAmount;
}
