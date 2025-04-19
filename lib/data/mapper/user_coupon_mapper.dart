import 'package:frontend_mobile/core/resource/constant.dart';
import 'package:frontend_mobile/data/entity/user_coupon/coupon_detail_entity.dart';
import 'package:frontend_mobile/data/entity/user_coupon/coupon_entity.dart';
import 'package:frontend_mobile/data/entity/user_coupon/coupon_usage_status_entity.dart';
import 'package:frontend_mobile/data/request_body/user_coupon/issue_coupon_request_body.dart';
import 'package:frontend_mobile/domain/model/user_coupon/coupon_detail_model.dart';
import 'package:frontend_mobile/domain/model/user_coupon/coupon_model.dart';
import 'package:frontend_mobile/domain/model/user_coupon/coupon_usage_status_model.dart';
import 'package:frontend_mobile/domain/param/user_coupon/issue_coupon_params.dart';

extension CouponEntityExt on CouponEntity {
  CouponModel toModel() => CouponModel(
    userCouponId: userCouponId,
    couponName: couponName,
    couponCode: couponCode,
    storeName: storeName,
    qrImageUrl: qrImageUrl,
    expiryDate: expiryDate,
    used: used,
  );
}

extension CouponDetailEntityExt on CouponDetailEntity {
  CouponDetailModel toModel() => CouponDetailModel(
    userCouponId: userCouponId,
    couponName: couponName,
    couponCode: couponCode,
    storeName: storeName,
    conditionType: CouponConditionType.fromText(text: conditionType),
    expiryDate: expiryDate,
    qrImageUrl: qrImageUrl,
    used: used,
    expired: expired,
  );
}

extension CouponUsageStatusEntityExt on CouponUsageStatusEntity {
  CouponUsageStatusModel toModel() => CouponUsageStatusModel(
    usedCount: usedCount,
    unusedCount: unusedCount,
    expiredCount: expiredCount,
  );
}

extension IssueCouponParamsExt on IssueCouponParams {
  IssueCouponRequestBody toBody() =>
      IssueCouponRequestBody(userUuid: userUuid, couponUuid: couponUuid);
}
