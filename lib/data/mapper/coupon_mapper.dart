import 'package:frontend_mobile/data/entity/coupon/coupon_entity.dart';
import 'package:frontend_mobile/domain/model/coupon/coupon_model.dart';

extension CouponEntityExt on CouponEntity {
  CouponModel toModel() => CouponModel(
    couponId: couponId,
    couponUuid: couponUuid,
    storeUuid: storeUuid,
    name: name,
    status: status,
    target: target,
    hasExposureDate: hasExposureDate,
    hasExpiryDate: hasExpiryDate,
    hasQuantity: hasQuantity,
    couponType: CouponTypeModel(
      type: couponType.type,
      discountType: couponType.discountType,
      discountAmount: couponType.discountAmount,
    ),
    condition: CouponConditionModel(
      conditionType: condition.conditionType,
      minimumPurchaseAmount: condition.minimumPurchaseAmount,
    ),
    createdAt: createdAt,
    exposureStartAt: exposureStartAt,
    exposureEndAt: exposureEndAt,
    expiryDate: expiryDate,
    quantity: quantity,
  );
}
