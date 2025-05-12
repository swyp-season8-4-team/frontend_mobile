import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coupon_usage_status_entity.g.dart';

@JsonSerializable()
class UserCouponUsageStatusEntity {
  const UserCouponUsageStatusEntity({
    this.usedCount = -1,
    this.unusedCount = -1,
    this.expiredCount = -1,
  });

  factory UserCouponUsageStatusEntity.fromJson(Map<String, dynamic> json) =>
      _$UserCouponUsageStatusEntityFromJson(json);

  final int usedCount;
  final int unusedCount;
  final int expiredCount;
}
