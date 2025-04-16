abstract class Constant {
  static String tokenInfo = 'TOKEN_INFO';
}

enum DayOfWeek {
  monday,
  tuesday,
  wednsday,
  thursday,
  friday,
  saturday,
  sunday;

  static DayOfWeek fromText({required String text}) {
    return DayOfWeek.values.firstWhere(
      (DayOfWeek day) => day.name == text.toLowerCase(),
      orElse: () {
        throw ArgumentError('Invalid day of week: $text');
      },
    );
  }
}

// 쿠폰 조건 타입
enum CouponConditionType {
  ammount,
  timeDay,
  exclusive,
  custom;

  static CouponConditionType fromText({required String text}) {
    return switch (text) {
      'AMOUNT' => CouponConditionType.ammount,
      'TIME_DAY' => CouponConditionType.timeDay,
      'EXCLUSIVE' => CouponConditionType.exclusive,
      'CUSTOM' => CouponConditionType.custom,
      _ => throw ArgumentError('Invalid coupon condition type : $text'),
    };
  }
}
