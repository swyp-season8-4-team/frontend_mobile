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
