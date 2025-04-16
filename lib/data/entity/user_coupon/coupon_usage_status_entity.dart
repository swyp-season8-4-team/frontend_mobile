import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coupon_usage_status_entity.g.dart';

@JsonSerializable()
class CouponUsageStatusEntity {
  const CouponUsageStatusEntity({
    required this.usedCount,
    required this.unusedCount,
    required this.expiredCount,
  });

  factory CouponUsageStatusEntity.fromJson(Map<String, dynamic> json) =>
      _$CouponUsageStatusEntityFromJson(json);
  final int usedCount;
  final int unusedCount;
  final int expiredCount;
}
