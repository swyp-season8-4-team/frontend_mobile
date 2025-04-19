import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coupon_entity.g.dart';

@JsonSerializable()
class CouponEntity {
  const CouponEntity({
    required this.couponType,
    required this.condition,
    required this.createdAt,
    this.couponId = -1,
    this.couponUuid = '',
    this.storeUuid = '',
    this.name = '',
    this.status = '',
    this.target = '',
    this.hasExposureDate = false,
    this.exposureStartAt,
    this.exposureEndAt,
    this.hasExpiryDate = false,
    this.expiryDate,
    this.hasQuantity = false,
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
