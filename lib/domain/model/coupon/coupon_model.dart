class CouponModel {
  const CouponModel({
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
    required this.exposureStartAt,
    required this.exposureEndAt,
    required this.expiryDate,
    required this.quantity,
  });

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
  final CouponTypeModel couponType;
  final CouponConditionModel condition;
  final DateTime createdAt;
}

class CouponTypeModel {
  const CouponTypeModel({
    required this.type,
    required this.discountType,
    required this.discountAmount,
  });

  final String type;
  final String discountType;
  final int discountAmount;
}

class CouponConditionModel {
  const CouponConditionModel({
    required this.conditionType,
    required this.minimumPurchaseAmount,
  });

  final String conditionType;
  final int minimumPurchaseAmount;
}
