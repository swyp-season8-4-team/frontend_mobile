import 'package:frontend_mobile/core/resource/constant.dart';
import 'package:frontend_mobile/data/entity/store/store_by_location_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_detail_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_holiday_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_operating_hour_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_summary_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_top_preference_entity.dart';
import 'package:frontend_mobile/data/query_param/store/get_my_preferences_stores_by_location_query_param.dart';
import 'package:frontend_mobile/data/query_param/store/get_stores_by_location_query_param.dart';
import 'package:frontend_mobile/domain/model/store/store_by_location_model.dart';
import 'package:frontend_mobile/domain/model/store/store_detail_model.dart';
import 'package:frontend_mobile/domain/model/store/store_holiday_model.dart';
import 'package:frontend_mobile/domain/model/store/store_operating_hour_model.dart';
import 'package:frontend_mobile/domain/model/store/store_summary_model.dart';
import 'package:frontend_mobile/domain/model/store/store_top_preference_model.dart';
import 'package:frontend_mobile/domain/param/store/get_my_preferences_stores_by_location_params.dart';
import 'package:frontend_mobile/domain/param/store/get_stores_by_location_params.dart';

extension StoreHolidayEntityExt on StoreHolidayEntity {
  StoreHolidayModel toModel() =>
      StoreHolidayModel(startDate: startDate, endDate: endDate, reason: reason);
}

extension StoreOperatingHourEntityExt on StoreOperatingHourEntity {
  StoreOperatingHourModel toModel() => StoreOperatingHourModel(
    dayOfWeek: DayOfWeek.fromText(text: dayOfWeek),
    openingTime: openingTime,
    closingTime: closingTime,
    isClosed: isClosed,
    lastOrderTime: lastOrderTime,
    regularClosureType:
        regularClosureType == null
            ? null
            : RegularClosureType.fromText(text: regularClosureType!),
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

extension StoreDetailMenuEntityExt on StoreDetailMenu {
  StoreDetailMenuModel toModel() => StoreDetailMenuModel(
    menuUuid: menuUuid,
    name: name,
    price: price,
    isPopular: isPopular,
    description: description,
    images: images,
  );
}

extension StoreDetailReviewEntityExt on StoreDetailReview {
  StoreDetailReviewModel toModel() => StoreDetailReviewModel(
    reviewUuid: reviewUuid,
    storeId: storeId,
    userUuid: userUuid,
    nickname: nickname,
    content: content,
    rating: rating,
    createdAt: createdAt,
    profileImage: profileImage,
    images: images,
  );
}

extension StoreDetailCommunityReviewEntityExt on StoreDetailCommunityReview {
  StoreDetailCommunityReviewModel toModel() => StoreDetailCommunityReviewModel(
    reviewUuid: reviewUuid,
    userUuid: userUuid,
    nickname: nickname,
    profileImage: profileImage,
    thumbnail: thumbnail,
    title: title,
    content: content,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

extension StoreDetailMateEntityExt on StoreDetailMate {
  StoreDetailMateModel toModel() => StoreDetailMateModel(
    mateUuid: mateUuid,
    mateCategory: mateCategory,
    thumbnail: thumbnail,
    title: title,
    content: content,
    nickname: nickname,
    recruitYn: recruitYn,
    saved: saved,
  );
}

extension StoreDetailNoticeEntityExt on StoreDetailNoticeEntity {
  StoreDetailNoticeModel toModel() => StoreDetailNoticeModel(
    noticeId: noticeId,
    tag: tag,
    title: title,
    content: content,
    createdAt: createdAt,
    updatedAt: updatedAt,
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
    storeImages: storeImages?.map((StoreDetailImage e) => e.toModel()).toList(),
    ownerPickImages:
        ownerPickImages?.map((StoreDetailImage e) => e.toModel()).toList(),
    primaryStoreLink: primaryStoreLink,
    storeLinks: storeLinks,
    holidays: holidays?.map((StoreHolidayEntity e) => e.toModel()).toList(),
    topPreferences:
        topPreferences
            ?.map((StoreTopPreferenceEntity e) => e.toModel())
            .toList(),
    description: description,
    animalYn: animalYn,
    tumblerYn: tumblerYn,
    parkingYn: parkingYn,
  );
}

extension StoreDetailTagCategoryEntityExt on StoreDetailTagCategoryEntity {
  StoreDetailTagCategoryModel toModel() =>
      StoreDetailTagCategoryModel(id: id, name: name);
}

extension StoreDetailTagEntityExt on StoreDetailTagEntity {
  StoreDetailTagModel toModel() =>
      StoreDetailTagModel(id: id, name: name, category: category?.toModel());
}

extension StoreDetailEntityExt on StoreDetailEntity {
  StoreDetailModel toModel() => StoreDetailModel(
    storeId: storeId,
    storeUuid: storeUuid,
    name: name,
    tags: tags.map((StoreDetailTagEntity e) => e.toModel()).toList(),
    operatingHours:
        operatingHours
            .map((StoreOperatingHourEntity e) => e.toModel())
            .toList(),
    address: address,
    phone: phone,
    ownerId: ownerId,
    ownerUuid: ownerUuid,
    latitude: latitude,
    longitude: longitude,
    menus: menus.map((StoreDetailMenu e) => e.toModel()).toList(),
    totalReviewCount: totalReviewCount,
    userId: userId,
    userUuid: userUuid,
    storeReviews:
        storeReviews?.map((StoreDetailReview e) => e.toModel()).toList(),
    communityReviews:
        communityReviews
            ?.map((StoreDetailCommunityReview e) => e.toModel())
            .toList(),
    mate: mate?.map((StoreDetailMate e) => e.toModel()).toList(),
    saved: saved,
    savedListId: savedListId,
    notices: notices?.map((StoreDetailNoticeEntity e) => e.toModel()).toList(),
    averageRating: averageRating,
    storeImages: storeImages?.map((StoreDetailImage e) => e.toModel()).toList(),
    ownerPickImages:
        ownerPickImages?.map((StoreDetailImage e) => e.toModel()).toList(),
    primaryStoreLink: primaryStoreLink,
    storeLinks: storeLinks,
    holidays: holidays?.map((StoreHolidayEntity e) => e.toModel()).toList(),
    topPreferences:
        topPreferences
            ?.map((StoreTopPreferenceEntity e) => e.toModel())
            .toList(),
    description: description,
    descriptionUpdateTime: descriptionUpdateTime,
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

extension StoreTopPreferenceEntityExt on StoreTopPreferenceEntity {
  StoreTopPreferenceModel toModel() =>
      StoreTopPreferenceModel(tagId: tagId, name: name, rank: rank);
}

extension StoreDetailImageEntityExt on StoreDetailImage {
  StoreDetailImageModel toModel() => StoreDetailImageModel(id: id, url: url);
}
