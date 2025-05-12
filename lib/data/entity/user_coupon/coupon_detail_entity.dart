import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/util/json_converter.dart';

part 'generated/coupon_detail_entity.g.dart';

@JsonSerializable()
class UserCouponDetailEntity {
  const UserCouponDetailEntity({
    this.userCouponId = -1,
    this.qrImageUrl = '',
    this.storeName = '',
    this.couponName = '',
    this.couponCode = '',
    this.conditionType = '',
    this.storeUuid = '',
    this.couponUuid = '',
    this.expiryDate,
    this.expired,
  });

  factory UserCouponDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$UserCouponDetailEntityFromJson(json);

  final int userCouponId;
  final String qrImageUrl;
  final String storeName;
  final String couponName;
  @DateTimeJsonConverter()
  final DateTime? expiryDate;
  final String couponCode;
  final String conditionType;
  final String storeUuid;
  final String couponUuid;
  final bool? expired;
}
