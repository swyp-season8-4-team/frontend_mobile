class UserCouponIssueStatusModel {
  const UserCouponIssueStatusModel({
    required this.couponId,
    required this.couponName,
    required this.issued,
  });
  final int couponId;
  final String couponName;
  final bool issued;
}
