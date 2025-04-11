import 'package:frontend_mobile/domain/model/store/store_holiday_model.dart';
import 'package:frontend_mobile/domain/model/store/store_operating_hour_model.dart';

class StoreByLocationModel {
  const StoreByLocationModel({
    required this.storeId,
    required this.storeUuid,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.operatingHours,
    required this.shortReviewCount,
    required this.tags,
    required this.storeImage,
    required this.holidays,
  });
  final int storeId;
  final String storeUuid;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final List<StoreOperatingHourModel> operatingHours;
  final List<StoreHolidayModel>? holidays;
  final int shortReviewCount;
  final List<String> tags;
  final String? storeImage;
}
