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

/// 디저트 메이트 카테고리
enum DessertBoardCategory { all, amity, photo, study, health, bread, cafe }
