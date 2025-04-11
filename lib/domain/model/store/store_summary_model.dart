import 'package:frontend_mobile/domain/model/store/store_holiday_model.dart';
import 'package:frontend_mobile/domain/model/store/store_operating_hour_model.dart';

class StoreSummaryModel {
  const StoreSummaryModel({
    required this.storeId,
    required this.storeUuid,
    required this.name,
    required this.tags,
    required this.operatingHours,
    required this.address,
    required this.phone,
    required this.averageRating,
    required this.storeImages,
    required this.ownerPickImages,
    required this.primaryStoreLink,
    required this.storeLinks,
    required this.holidays,
    required this.topPreferences,
    required this.description,
    required this.animalYn,
    required this.tumblerYn,
    required this.parkingYn,
  });
  final int storeId;
  final String storeUuid;
  final String name;
  final double? averageRating;
  final List<String>? storeImages;
  final List<String>? ownerPickImages;
  final List<String> tags;
  final String? primaryStoreLink;
  final List<String>? storeLinks;
  final List<StoreOperatingHourModel> operatingHours;
  final List<StoreHolidayModel>? holidays;
  final List<String>? topPreferences;
  final String address;
  final String phone;
  final String? description;
  final bool? animalYn;
  final bool? tumblerYn;
  final bool? parkingYn;
}
