import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/store_holiday_entity.g.dart';

@JsonSerializable()
class StoreHolidayEntity {
  const StoreHolidayEntity({
    this.startDate = '',
    this.endDate = '',
    this.reason = '',
  });

  factory StoreHolidayEntity.fromJson(Map<String, dynamic> json) =>
      _$StoreHolidayEntityFromJson(json);

  final String startDate;
  final String endDate;
  final String reason;
}
