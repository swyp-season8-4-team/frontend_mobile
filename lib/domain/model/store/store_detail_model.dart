import 'package:frontend_mobile/core/resource/constant.dart';
import 'package:frontend_mobile/domain/model/store/store_holiday_model.dart';
import 'package:frontend_mobile/domain/model/store/store_operating_hour_model.dart';
import 'package:frontend_mobile/domain/model/store/store_top_preference_model.dart';

class StoreDetailModel {
  StoreDetailModel({
    required this.storeId,
    required this.storeUuid,
    required this.name,
    required this.tags,
    required this.operatingHours,
    required this.address,
    required this.phone,
    required this.ownerId,
    required this.ownerUuid,
    required this.latitude,
    required this.longitude,
    required this.menus,
    required this.totalReviewCount,
    required this.userId,
    required this.userUuid,
    required this.storeReviews,
    required this.communityReviews,
    required this.mate,
    required this.saved,
    required this.savedListId,
    required this.notices,
    required this.averageRating,
    required this.storeImages,
    required this.ownerPickImages,
    required this.primaryStoreLink,
    required this.storeLinks,
    required this.holidays,
    required this.topPreferences,
    required this.description,
    required this.descriptionUpdateTime,
    required this.animalYn,
    required this.tumblerYn,
    required this.parkingYn,
  });

  final int storeId;
  final String storeUuid;
  final String name;
  final double? averageRating;
  final List<StoreDetailImageModel>? storeImages;
  final List<StoreDetailImageModel>? ownerPickImages;
  final List<StoreDetailTagModel> tags;
  final String? primaryStoreLink;
  final List<String>? storeLinks;
  final List<StoreOperatingHourModel> operatingHours;
  final List<StoreHolidayModel>? holidays;
  final List<StoreTopPreferenceModel>? topPreferences;
  final String address;
  final String phone;
  final String? description;
  final DateTime? descriptionUpdateTime;
  final bool? animalYn;
  final bool? tumblerYn;
  final bool? parkingYn;
  final int? userId;
  final String? userUuid;
  final int ownerId;
  final String ownerUuid;
  final double latitude;
  final double longitude;
  final List<StoreDetailMenuModel> menus;
  final int totalReviewCount;
  final List<StoreDetailReviewModel>? storeReviews;
  final List<StoreDetailCommunityReviewModel>? communityReviews;
  final List<StoreDetailMateModel>? mate;
  final bool? saved;
  final int? savedListId;
  final List<StoreDetailNoticeModel>? notices;
}

class StoreDetailMenuModel {
  const StoreDetailMenuModel({
    required this.menuUuid,
    required this.name,
    required this.price,
    required this.isPopular,
    required this.description,
    required this.images,
  });
  final String menuUuid;
  final String name;
  final int price;
  final bool? isPopular;
  final String? description;
  final List<String>? images;
}

class StoreDetailReviewModel {
  const StoreDetailReviewModel({
    required this.reviewUuid,
    required this.storeId,
    required this.userUuid,
    required this.nickname,
    required this.gender,
    required this.content,
    required this.rating,
    required this.createdAt,
    required this.profileImage,
    required this.images,
  });

  final String reviewUuid;
  final int storeId;
  final String userUuid;
  final String nickname;
  final ReviewerGender gender;
  final String? profileImage;
  final String content;
  final double rating;
  final DateTime createdAt;
  final List<String>? images;
}

class StoreDetailCommunityReviewModel {
  const StoreDetailCommunityReviewModel({
    required this.reviewUuid,
    required this.userUuid,
    required this.nickname,
    required this.profileImage,
    required this.thumbnail,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });
  final String reviewUuid;
  final String userUuid;
  final String nickname;
  final String profileImage;
  final String thumbnail;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
}

class StoreDetailMateModel {
  const StoreDetailMateModel({
    required this.mateUuid,
    required this.mateCategory,
    required this.thumbnail,
    required this.title,
    required this.content,
    required this.nickname,
    required this.recruitYn,
    required this.saved,
  });

  final String mateUuid;
  final String mateCategory;
  final String thumbnail;
  final String title;
  final String content;
  final String nickname;
  final bool recruitYn;
  final bool? saved;
}

class StoreDetailNoticeModel {
  const StoreDetailNoticeModel({
    required this.noticeId,
    required this.tag,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });
  final int noticeId;
  final String tag;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime? updatedAt;
}

class StoreDetailTagModel {
  const StoreDetailTagModel({
    required this.id,
    required this.name,
    required this.category,
  });

  final int id;
  final String name;
  final StoreDetailTagCategoryModel? category;
}

class StoreDetailTagCategoryModel {
  const StoreDetailTagCategoryModel({required this.id, required this.name});

  final int id;
  final String name;
}

class StoreDetailImageModel {
  const StoreDetailImageModel({required this.id, required this.url});
  final int? id;
  final String? url;
}
