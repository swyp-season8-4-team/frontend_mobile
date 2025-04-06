import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/get_store_holiday_entity.g.dart';

@JsonSerializable()
class GetStoreHolidayEntity {
  const GetStoreHolidayEntity({required this.date, this.reason});

  factory GetStoreHolidayEntity.fromJson(Map<String, dynamic> json) =>
      _$GetStoreHolidayEntityFromJson(json);

  final String date;
  final String? reason;
}
