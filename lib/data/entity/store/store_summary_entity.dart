import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/data/entity/store/store_detail_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_holiday_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_operating_hour_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_top_preference_entity.dart';

part 'generated/store_summary_entity.g.dart';

@JsonSerializable()
class StoreSummaryEntity {
  factory StoreSummaryEntity.fromJson(Map<String, dynamic> json) =>
      _$StoreSummaryEntityFromJson(json);

  const StoreSummaryEntity({
    required this.storeId,
    required this.storeUuid,
    required this.name,
    required this.tags,
    required this.operatingHours,
    required this.address,
    required this.phone,
    this.averageRating,
    this.storeImages,
    this.ownerPickImages,
    this.primaryStoreLink,
    this.storeLinks,
    this.holidays,
    this.topPreferences,
    this.description,
    this.animalYn,
    this.tumblerYn,
    this.parkingYn,
  });
  final int storeId;
  final String storeUuid;
  final String name;
  final double? averageRating;
  final List<StoreDetailImage>? storeImages;
  final List<StoreDetailImage>? ownerPickImages;
  final List<String> tags;
  final String? primaryStoreLink;
  final List<String>? storeLinks;
  final List<StoreOperatingHourEntity> operatingHours;
  final List<StoreHolidayEntity>? holidays;
  final List<StoreTopPreferenceEntity>? topPreferences;
  final String address;
  final String phone;
  final String? description;
  final bool? animalYn;
  final bool? tumblerYn;
  final bool? parkingYn;
}
