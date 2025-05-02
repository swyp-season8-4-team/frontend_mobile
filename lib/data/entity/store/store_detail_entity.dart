import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/util/json_converter.dart';
import 'package:frontend_mobile/data/entity/store/store_holiday_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_operating_hour_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_top_preference_entity.dart';
part 'generated/store_detail_entity.g.dart';

//ignore_for_file: library_private_types_in_public_api

@JsonSerializable()
class StoreDetailEntity {
  factory StoreDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$StoreDetailEntityFromJson(json);

  StoreDetailEntity({
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
    this.userId,
    this.userUuid,
    this.storeReviews,
    this.communityReviews,
    this.mate,
    this.saved,
    this.savedListId,
    this.notices,
    this.averageRating,
    this.storeImages,
    this.ownerPickImages,
    this.primaryStoreLink,
    this.storeLinks,
    this.holidays,
    this.topPreferences,
    this.description,
    this.descriptionUpdateTime,
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
  final List<StoreDetailTagEntity> tags;
  final String? primaryStoreLink;
  final List<String>? storeLinks;
  final List<StoreOperatingHourEntity> operatingHours;
  final List<StoreHolidayEntity>? holidays;
  final List<StoreTopPreferenceEntity>? topPreferences;
  final String address;
  final String phone;
  final String? description;
  @DateTimeJsonConverter()
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
  final List<StoreDetailMenu> menus;
  final int totalReviewCount;
  final List<StoreDetailReview>? storeReviews;
  final List<StoreDetailCommunityReview>? communityReviews;
  final List<StoreDetailMate>? mate;
  final bool? saved;
  final int? savedListId;
  final List<StoreDetailNoticeEntity>? notices;
}

@JsonSerializable()
class StoreDetailMenu {
  factory StoreDetailMenu.fromJson(Map<String, dynamic> json) =>
      _$StoreDetailMenuFromJson(json);

  const StoreDetailMenu({
    required this.menuUuid,
    required this.name,
    required this.price,
    this.isPopular,
    this.description,
    this.images,
  });
  final String menuUuid;
  final String name;
  final int price;
  final bool? isPopular;
  final String? description;
  final List<String>? images;
}

@JsonSerializable()
class StoreDetailReview {
  const StoreDetailReview({
    required this.reviewUuid,
    required this.storeId,
    required this.userUuid,
    required this.nickname,
    required this.content,
    required this.rating,
    required this.createdAt,
    this.profileImage,
    this.images,
  });

  factory StoreDetailReview.fromJson(Map<String, dynamic> json) =>
      _$StoreDetailReviewFromJson(json);

  final String reviewUuid;
  final int storeId;
  final String userUuid;
  final String nickname;
  final String? profileImage;
  final String content;
  final double rating;
  @DateTimeJsonConverter()
  final DateTime createdAt;
  final List<String>? images;
}

@JsonSerializable()
class StoreDetailCommunityReview {
  factory StoreDetailCommunityReview.fromJson(Map<String, dynamic> json) =>
      _$StoreDetailCommunityReviewFromJson(json);

  const StoreDetailCommunityReview({
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
  @DateTimeJsonConverter()
  final DateTime createdAt;
  @DateTimeJsonConverter()
  final DateTime updatedAt;
}

@JsonSerializable()
class StoreDetailMate {
  const StoreDetailMate({
    required this.mateUuid,
    required this.mateCategory,
    required this.thumbnail,
    required this.title,
    required this.content,
    required this.nickname,
    required this.recruitYn,
    this.saved,
  });

  factory StoreDetailMate.fromJson(Map<String, dynamic> json) =>
      _$StoreDetailMateFromJson(json);

  final String mateUuid;
  final String mateCategory;
  final String thumbnail;
  final String title;
  final String content;
  final String nickname;
  final bool recruitYn;
  final bool? saved;
}

@JsonSerializable()
class StoreDetailNoticeEntity {
  factory StoreDetailNoticeEntity.fromJson(Map<String, dynamic> json) =>
      _$StoreDetailNoticeEntityFromJson(json);
  const StoreDetailNoticeEntity({
    required this.noticeId,
    required this.tag,
    required this.title,
    required this.content,
    required this.createdAt,
    this.updatedAt,
  });
  final int noticeId;
  final String tag;
  final String title;
  final String content;
  @DateTimeJsonConverter()
  final DateTime createdAt;
  @DateTimeJsonConverter()
  final DateTime? updatedAt;
}

@JsonSerializable()
class StoreDetailTagEntity {
  const StoreDetailTagEntity({
    required this.id,
    required this.name,
    this.category,
  });

  factory StoreDetailTagEntity.fromJson(Map<String, dynamic> json) =>
      _$StoreDetailTagEntityFromJson(json);
  final int id;
  final String name;
  final StoreDetailTagCategoryEntity? category;
}

@JsonSerializable()
class StoreDetailTagCategoryEntity {
  const StoreDetailTagCategoryEntity({required this.id, required this.name});

  factory StoreDetailTagCategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$StoreDetailTagCategoryEntityFromJson(json);
  final int id;
  final String name;
}

@JsonSerializable()
class StoreDetailImage {
  factory StoreDetailImage.fromJson(Map<String, dynamic> json) =>
      _$StoreDetailImageFromJson(json);

  const StoreDetailImage({this.id, this.url});
  final int? id;
  final String? url;
}
