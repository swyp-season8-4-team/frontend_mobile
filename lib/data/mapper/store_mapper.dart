import 'package:frontend_mobile/core/resource/constant.dart';
import 'package:frontend_mobile/data/entity/store/store_by_location_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_holiday_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_operating_hour_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_summary_entity.dart';
import 'package:frontend_mobile/data/query_param/store/get_my_preferences_stores_by_location_query_param.dart';
import 'package:frontend_mobile/data/query_param/store/get_stores_by_location_query_param.dart';
import 'package:frontend_mobile/domain/model/store/store_by_location_model.dart';
import 'package:frontend_mobile/domain/model/store/store_holiday_model.dart';
import 'package:frontend_mobile/domain/model/store/store_operating_hour_model.dart';
import 'package:frontend_mobile/domain/model/store/store_summary_model.dart';
import 'package:frontend_mobile/domain/param/store/get_my_preferences_stores_by_location_params.dart';
import 'package:frontend_mobile/domain/param/store/get_stores_by_location_params.dart';

extension StoreHolidayEntityExt on StoreHolidayEntity {
  StoreHolidayModel toModel() => StoreHolidayModel(date: date, reason: reason);
}

extension StoreOperatingHourEntityExt on StoreOperatingHourEntity {
  StoreOperatingHourModel toModel() => StoreOperatingHourModel(
    dayOfWeek: DayOfWeek.fromText(text: dayOfWeek),
    openingTime: openingTime,
    closingTime: closingTime,
    isClosed: isClosed,
    lastOrderTime: lastOrderTime,
    regularClosureType: regularClosureType,
    regularClosureWeeks: regularClosureWeeks,
    breakTimes:
        breakTimes
            ?.map(
              // ignore: always_specify_types
              (e) => StoreBreakTimeModel(
                startTime: e.startTime,
                endTime: e.endTime,
              ),
            )
            .toList(),
  );
}

extension StoreByLocationEntityExt on StoreByLocationEntity {
  StoreByLocationModel toModel() => StoreByLocationModel(
    storeId: storeId,
    storeUuid: storeUuid,
    name: name,
    address: address,
    latitude: latitude,
    longitude: longitude,
    operatingHours:
        operatingHours
            .map((StoreOperatingHourEntity e) => e.toModel())
            .toList(),
    shortReviewCount: shortReviewCount,
    tags: tags,
    storeImage: storeImage,
    holidays: holidays?.map((StoreHolidayEntity e) => e.toModel()).toList(),
  );
}

extension StoreSummaryEntityExt on StoreSummaryEntity {
  StoreSummaryModel toModel() => StoreSummaryModel(
    storeId: storeId,
    storeUuid: storeUuid,
    name: name,
    tags: tags,
    operatingHours:
        operatingHours
            .map((StoreOperatingHourEntity e) => e.toModel())
            .toList(),
    address: address,
    phone: phone,
    averageRating: averageRating,
    storeImages: storeImages,
    ownerPickImages: ownerPickImages,
    primaryStoreLink: primaryStoreLink,
    storeLinks: storeLinks,
    holidays: holidays?.map((StoreHolidayEntity e) => e.toModel()).toList(),
    topPreferences: topPreferences,
    description: description,
    animalYn: animalYn,
    tumblerYn: tumblerYn,
    parkingYn: parkingYn,
  );
}

extension GetStoreByLocationParamsExt on GetStoresByLocationParams {
  GetStoresByLocationQueryParam toQuery() => GetStoresByLocationQueryParam(
    latitude: latitude,
    longitude: longitude,
    radius: radius,
    preferenceTagIds: preferenceTagIds,
    searchKeyword: searchKeyword,
  );
}

extension GetMyPreferencesStoresByLocationParamsExt
    on GetMyPreferencesStoresByLocationParams {
  GetMyPreferencesStoresByLocationQueryParam toQuery() =>
      GetMyPreferencesStoresByLocationQueryParam(
        latitude: latitude,
        longitude: longitude,
        radius: radius,
      );
}
