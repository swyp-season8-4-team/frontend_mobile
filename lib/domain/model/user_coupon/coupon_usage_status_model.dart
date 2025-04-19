class UserCouponUsageStatusModel {
  const UserCouponUsageStatusModel({
    required this.usedCount,
    required this.unusedCount,
    required this.expiredCount,
  });

  final int usedCount;
  final int unusedCount;
  final int expiredCount;
}
