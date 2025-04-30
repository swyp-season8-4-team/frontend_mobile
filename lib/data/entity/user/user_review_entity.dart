import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user_review_entity.g.dart';

@JsonSerializable()
class UserReviewEntity {
  const UserReviewEntity({required this.reviewCount, required this.reviews});

  factory UserReviewEntity.fromJson(Map<String, dynamic> json) =>
      _$UserReviewEntityFromJson(json);
  final int reviewCount;
  final List<UserReviewDetailEntity> reviews;
}

@JsonSerializable()
class UserReviewDetailEntity {
  factory UserReviewDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$UserReviewDetailEntityFromJson(json);
  const UserReviewDetailEntity({
    required this.reviewUuid,
    required this.rating,
    required this.content,
    required this.createdAt,
    required this.store,
    this.reviewImage,
  });
  final String reviewUuid;
  final String? reviewImage;
  final double rating;
  final String content;
  final DateTime createdAt;
  final UserReviewStoreEntity store;
}

@JsonSerializable()
class UserReviewStoreEntity {
  factory UserReviewStoreEntity.fromJson(Map<String, dynamic> json) =>
      _$UserReviewStoreEntityFromJson(json);
  const UserReviewStoreEntity({
    required this.storeUuid,
    required this.name,
    required this.address,
    this.thumbnail,
  });
  final String storeUuid;
  final String? thumbnail;
  final String name;
  final String address;
}
