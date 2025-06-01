abstract class Constant {
  static String tokenInfo = 'TOKEN_INFO';
}

// 저장 리스트 아이콘 컬러
enum StoreListIconColor {
  yellow(id: 1),
  orange(id: 2),
  green(id: 3),
  ocean(id: 4);

  const StoreListIconColor({required this.id});

  final int id;
}

// 요일
enum DayOfWeek {
  monday(label: '월'),
  tuesday(label: '화'),
  wednesday(label: '수'),
  thursday(label: '목'),
  friday(label: '금'),
  saturday(label: '토'),
  sunday(label: '일');

  const DayOfWeek({required this.label});

  final String label;

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

// 정기 휴무 유형
enum RegularClosureType {
  monthly,
  weekly;

  static RegularClosureType fromText({required String text}) {
    return RegularClosureType.values.firstWhere(
      (RegularClosureType e) => e.name == text.toLowerCase(),
      orElse: () {
        throw ArgumentError('Invalid regular closure type: $text');
      },
    );
  }
}

/// 닉네임 인증 호출 목적
enum Nickname {
  signUp(value: 'SIGNUP'),
  profileUpdate(value: 'PROFILE_UPDATE');

  const Nickname({required this.value});

  final String value;
}

/// 디저트 메이트 카테고리
enum DessertBoardCategory { all, amity, photo, study, health, bread, cafe }

/// 신고 카테고리
enum ReportCategory {
  swearWord(text: '욕설 또는 폭언', id: 1),
  pornography(text: '음란물 또는 부적절한 내용', id: 2),
  advertisement(text: '광고 또는 스팸', id: 3),
  disinformation(text: '허위 정보', id: 4),
  spam(text: '게시물 도배', id: 5),
  etc(text: '기타', id: 6);

  const ReportCategory({required this.text, required this.id});

  final String text;
  final int id;
}

/// 리뷰 작성자 성별
enum ReviewerGender {
  male,
  female;

  static ReviewerGender fromKey({required String key}) {
    return switch (key) {
      'MALE' => ReviewerGender.male,
      'FEMALE' => ReviewerGender.female,
      _ => ReviewerGender.male,
    };
  }
}
