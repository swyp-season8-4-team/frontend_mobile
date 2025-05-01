import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/util/json_converter.dart';

part 'generated/coupon_entity.g.dart';

@JsonSerializable()
class UserCouponEntity {
  const UserCouponEntity({
    required this.userCouponId,
    required this.couponName,
    required this.couponCode,
    required this.storeName,
    this.qrImageUrl,
    this.expiryDate,
    this.used,
  });

  factory UserCouponEntity.fromJson(Map<String, dynamic> json) =>
      _$UserCouponEntityFromJson(json);

  final int userCouponId;
  final String couponName;
  final String couponCode;
  final String? qrImageUrl;
  final String storeName;
  @DateTimeJsonConverter()
  final DateTime? expiryDate;
  final bool? used;
}
