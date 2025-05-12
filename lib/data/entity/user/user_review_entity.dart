import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/util/json_converter.dart';

part 'generated/user_review_entity.g.dart';

@JsonSerializable()
class UserReviewEntity {
  const UserReviewEntity({
    this.reviewCount = -1,
    this.reviews = const <UserReviewDetailEntity>[],
  });

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
    required this.createdAt,
    this.reviewUuid = '',
    this.rating = -1,
    this.content = '',
    this.store = const UserReviewStoreEntity(),
    this.reviewImage,
  });
  final String reviewUuid;
  final String? reviewImage;
  final double rating;
  final String content;
  @DateTimeJsonConverter()
  final DateTime createdAt;
  final UserReviewStoreEntity store;
}

@JsonSerializable()
class UserReviewStoreEntity {
  factory UserReviewStoreEntity.fromJson(Map<String, dynamic> json) =>
      _$UserReviewStoreEntityFromJson(json);
  const UserReviewStoreEntity({
    this.storeUuid = '',
    this.name = '',
    this.address = '',
    this.thumbnail,
  });
  final String storeUuid;
  final String? thumbnail;
  final String name;
  final String address;
}
