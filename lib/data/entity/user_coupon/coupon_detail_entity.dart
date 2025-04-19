import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/data/entity/user_coupon/coupon_entity.dart';

part 'generated/coupon_detail_entity.g.dart';

@JsonSerializable()
class CouponDetailEntity extends CouponEntity {
  CouponDetailEntity({
    required super.userCouponId,
    required super.couponName,
    required super.couponCode,
    required super.storeName,
    required this.conditionType,
    super.expiryDate,
    super.qrImageUrl,
    super.used,
    this.expired,
  });

  factory CouponDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$CouponDetailEntityFromJson(json);

  final String conditionType;
  final bool? expired;
}
