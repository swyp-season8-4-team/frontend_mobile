import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/data/entity/store/store_holiday_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_operating_hour_entity.dart';

part 'generated/store_by_location_entity.g.dart';

@JsonSerializable()
class StoreByLocationEntity {
  StoreByLocationEntity({
    this.storeId = -1,
    this.storeUuid = '',
    this.name = '',
    this.address = '',
    this.latitude = 0,
    this.longitude = 0,
    this.operatingHours = const <StoreOperatingHourEntity>[],
    this.shortReviewCount = -1,
    this.tags = const <String>[],
    this.storeImage,
    this.holidays,
  });

  factory StoreByLocationEntity.fromJson(Map<String, dynamic> json) =>
      _$StoreByLocationEntityFromJson(json);
  final int storeId;
  final String storeUuid;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final List<StoreOperatingHourEntity> operatingHours;
  final List<StoreHolidayEntity>? holidays;
  final int shortReviewCount;
  final List<String> tags;
  final String? storeImage;
}
