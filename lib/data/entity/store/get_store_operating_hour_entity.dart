import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/get_store_operating_hour_entity.g.dart';

@JsonSerializable()
class GetStoreOperatingHourEntity {
  const GetStoreOperatingHourEntity({
    required this.dayOfWeek,
    required this.openingTime,
    required this.closingTime,
    required this.lastOrderTime,
    required this.isClosed,
    required this.regularClosureType,
    required this.regularClosureWeeks,
    required this.breakTimes,
  });

  factory GetStoreOperatingHourEntity.fromJson(Map<String, dynamic> json) =>
      _$GetStoreOperatingHourEntityFromJson(json);
  final String dayOfWeek;
  final String openingTime;
  final String closingTime;
  final String lastOrderTime;
  final bool isClosed;
  final String regularClosureType;
  final String regularClosureWeeks;

  //ignore: library_private_types_in_public_api
  final List<_BreakTime> breakTimes;
}

@JsonSerializable()
class _BreakTime {
  factory _BreakTime.fromJson(Map<String, dynamic> json) =>
      _$BreakTimeFromJson(json);

  const _BreakTime({required this.startTime, required this.endTime});
  final String startTime;
  final String endTime;
}
