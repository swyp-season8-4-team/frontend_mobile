import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coupon_usage_status_entity.g.dart';

@JsonSerializable()
class UserCouponUsageStatusEntity {
  const UserCouponUsageStatusEntity({
    required this.usedCount,
    required this.unusedCount,
    required this.expiredCount,
  });

  factory UserCouponUsageStatusEntity.fromJson(Map<String, dynamic> json) =>
      _$UserCouponUsageStatusEntityFromJson(json);

  final int usedCount;
  final int unusedCount;
  final int expiredCount;
}
