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
