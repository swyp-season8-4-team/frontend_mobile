import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/data/entity/store/store_summary_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_holiday_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_operating_hour_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_top_preference_entity.dart';
part 'generated/store_detail_entity.g.dart';

//ignore_for_file: library_private_types_in_public_api

@JsonSerializable()
class StoreDetailEntity extends StoreSummaryEntity {
  factory StoreDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$StoreDetailEntityFromJson(json);

  StoreDetailEntity({
    required super.storeId,
    required super.storeUuid,
    required super.name,
    required super.tags,
    required super.operatingHours,
    required super.address,
    required super.phone,
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
    super.averageRating,
    super.storeImages,
    super.ownerPickImages,
    super.primaryStoreLink,
    super.storeLinks,
    super.holidays,
    super.topPreferences,
    super.description,
    super.animalYn,
    super.tumblerYn,
    super.parkingYn,
  });

  final int? userId;
  final String? userUuid;
  final int ownerId;
  final String ownerUuid;
  final double latitude;
  final double longitude;
  final List<_Menu> menus;
  final int totalReviewCount;
  final List<_StoreReview>? storeReviews;
  final List<_CommunityReview>? communityReviews;
  final List<_Mate>? mate;
  final bool? saved;
  final int? savedListId;
}

@JsonSerializable()
class _Menu {
  factory _Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

  const _Menu({
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
class _StoreReview {
  const _StoreReview({
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

  factory _StoreReview.fromJson(Map<String, dynamic> json) =>
      _$StoreReviewFromJson(json);
  final String reviewUuid;
  final int storeId;
  final String userUuid;
  final String nickname;
  final String? profileImage;
  final String content;
  final double rating;
  final DateTime createdAt;
  final List<String>? images;
}

@JsonSerializable()
class _CommunityReview {
  factory _CommunityReview.fromJson(Map<String, dynamic> json) =>
      _$CommunityReviewFromJson(json);

  const _CommunityReview({
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

@JsonSerializable()
class _Mate {
  const _Mate({
    required this.mateUuid,
    required this.mateCategory,
    required this.thumbnail,
    required this.title,
    required this.content,
    required this.nickname,
    required this.recruitYn,
    required this.saved,
  });

  factory _Mate.fromJson(Map<String, dynamic> json) => _$MateFromJson(json);
  final String mateUuid;
  final String mateCategory;
  final String thumbnail;
  final String title;
  final String content;
  final String nickname;
  final bool recruitYn;
  final bool saved;
}
