class UserCouponModel {
  const UserCouponModel({
    required this.userCouponId,
    required this.couponName,
    required this.couponCode,
    required this.storeName,
    required this.qrImageUrl,
    required this.expiryDate,
    required this.used,
  });

  final int userCouponId;
  final String couponName;
  final String couponCode;
  final String? qrImageUrl;
  final String storeName;
  final DateTime? expiryDate;
  final bool? used;
}
