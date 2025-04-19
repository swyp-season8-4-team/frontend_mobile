import 'package:frontend_mobile/core/resource/constant.dart';

class StoreOperatingHourModel {
  const StoreOperatingHourModel({
    required this.dayOfWeek,
    required this.openingTime,
    required this.closingTime,
    required this.isClosed,
    required this.lastOrderTime,
    required this.regularClosureType,
    required this.regularClosureWeeks,
    required this.breakTimes,
  });

  final DayOfWeek dayOfWeek;
  final String openingTime;
  final String closingTime;
  final String? lastOrderTime;
  final bool isClosed;
  final RegularClosureType? regularClosureType;
  final String? regularClosureWeeks;

  //ignore: library_private_types_in_public_api
  final List<StoreBreakTimeModel>? breakTimes;
}

class StoreBreakTimeModel {
  const StoreBreakTimeModel({required this.startTime, required this.endTime});
  final String startTime;
  final String endTime;
}
