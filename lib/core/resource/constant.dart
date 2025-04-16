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

enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
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
