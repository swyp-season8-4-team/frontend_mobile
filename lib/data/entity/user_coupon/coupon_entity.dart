import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coupon_entity.g.dart';

@JsonSerializable()
class CouponEntity {
  const CouponEntity({
    required this.userCouponId,
    required this.couponName,
    required this.couponCode,
    required this.storeName,
    this.qrImageUrl,
    this.expiryDate,
    this.used,
  });

  factory CouponEntity.fromJson(Map<String, dynamic> json) =>
      _$CouponEntityFromJson(json);
  final int userCouponId;
  final String couponName;
  final String couponCode;
  final String? qrImageUrl;
  final String storeName;
  final DateTime? expiryDate;
  final bool? used;
}
