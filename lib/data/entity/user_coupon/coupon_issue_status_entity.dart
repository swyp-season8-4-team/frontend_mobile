import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coupon_issue_status_entity.g.dart';

@JsonSerializable()
class CouponIssueStatusEntity {
  const CouponIssueStatusEntity({
    required this.couponId,
    required this.couponName,
    required this.issued,
  });

  factory CouponIssueStatusEntity.fromJson(Map<String, dynamic> json) =>
      _$CouponIssueStatusEntityFromJson(json);
  final int couponId;
  final String couponName;
  final bool issued;
}
