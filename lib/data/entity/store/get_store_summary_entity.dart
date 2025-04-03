import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/data/entity/store/get_store_holiday_entity.dart';
import 'package:frontend_mobile/data/entity/store/get_store_operating_hour_entity.dart';

part 'generated/get_store_summary_entity.g.dart';

@JsonSerializable()
class GetStoreSummaryEntity {
  factory GetStoreSummaryEntity.fromJson(Map<String, dynamic> json) =>
      _$GetStoreSummaryEntityFromJson(json);

  const GetStoreSummaryEntity({
    required this.storeId,
    required this.storeUuid,
    required this.name,
    required this.averageRating,
    required this.storeImages,
    required this.ownerPickImages,
    required this.tags,
    required this.primaryStoreLink,
    required this.storeLinks,
    required this.operatingHours,
    required this.holidays,
    required this.topPreferences,
    required this.address,
    required this.phone,
    required this.description,
    required this.animalYn,
    required this.tumblerYn,
    required this.parkingYn,
  });
  final int storeId;
  final String storeUuid;
  final String name;
  final double averageRating;
  final List<String> storeImages;
  final List<String> ownerPickImages;
  final List<String> tags;
  final String primaryStoreLink;
  final List<String> storeLinks;
  final List<GetStoreOperatingHourEntity> operatingHours;
  final List<GetStoreHolidayEntity> holidays;
  final List<String> topPreferences;
  final String address;
  final String phone;
  final String description;
  final bool animalYn;
  final bool tumblerYn;
  final bool parkingYn;
}
