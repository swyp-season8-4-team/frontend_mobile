import 'package:frontend_mobile/core/resource/constant.dart';
import 'package:frontend_mobile/domain/model/user_coupon/coupon_model.dart';

class CouponDetailModel extends CouponModel {
  CouponDetailModel({
    required super.userCouponId,
    required super.couponName,
    required super.couponCode,
    required super.storeName,
    required this.conditionType,
    required super.expiryDate,
    required super.qrImageUrl,
    required super.used,
    required this.expired,
  });

  final CouponConditionType conditionType;
  final bool? expired;
}
