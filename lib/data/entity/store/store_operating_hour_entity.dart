import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/store_operating_hour_entity.g.dart';

@JsonSerializable()
class StoreOperatingHourEntity {
  const StoreOperatingHourEntity({
    required this.dayOfWeek,
    required this.openingTime,
    required this.closingTime,
    required this.isClosed,
    this.lastOrderTime,
    this.regularClosureType,
    this.regularClosureWeeks,
    this.breakTimes,
  });

  factory StoreOperatingHourEntity.fromJson(Map<String, dynamic> json) =>
      _$StoreOperatingHourEntityFromJson(json);

  final String dayOfWeek;
  final String openingTime;
  final String closingTime;
  final String? lastOrderTime;
  final bool isClosed;
  final String? regularClosureType;
  final String? regularClosureWeeks;

  //ignore: library_private_types_in_public_api
  final List<_BreakTime>? breakTimes;
}

@JsonSerializable()
class _BreakTime {
  factory _BreakTime.fromJson(Map<String, dynamic> json) =>
      _$BreakTimeFromJson(json);

  const _BreakTime({required this.startTime, required this.endTime});
  final String startTime;
  final String endTime;
}
