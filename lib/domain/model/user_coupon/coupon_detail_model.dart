import 'package:frontend_mobile/core/resource/constant.dart';

class UserCouponDetailModel {
  const UserCouponDetailModel({
    required this.userCouponId,
    required this.qrImageUrl,
    required this.storeName,
    required this.couponName,
    required this.expiryDate,
    required this.couponCode,
    required this.conditionType,
    required this.storeUuid,
    required this.couponUuid,
    required this.expired,
  });

  final int userCouponId;
  final String qrImageUrl;
  final String storeName;
  final String couponName;
  final DateTime? expiryDate;
  final String couponCode;
  final CouponConditionType conditionType;
  final String storeUuid;
  final String couponUuid;
  final bool? expired;
}
