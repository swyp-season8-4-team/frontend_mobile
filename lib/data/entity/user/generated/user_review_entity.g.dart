// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_review_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserReviewEntity _$UserReviewEntityFromJson(Map<String, dynamic> json) =>
    UserReviewEntity(
      reviewCount: (json['reviewCount'] as num?)?.toInt() ?? -1,
      reviews:
          (json['reviews'] as List<dynamic>?)
              ?.map(
                (e) =>
                    UserReviewDetailEntity.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <UserReviewDetailEntity>[],
    );

Map<String, dynamic> _$UserReviewEntityToJson(UserReviewEntity instance) =>
    <String, dynamic>{
      'reviewCount': instance.reviewCount,
      'reviews': instance.reviews,
    };

UserReviewDetailEntity _$UserReviewDetailEntityFromJson(
  Map<String, dynamic> json,
) => UserReviewDetailEntity(
  createdAt: const DateTimeJsonConverter().fromJson(
    json['createdAt'] as String?,
  ),
  reviewUuid: json['reviewUuid'] as String? ?? '',
  rating: (json['rating'] as num?)?.toDouble() ?? -1,
  content: json['content'] as String? ?? '',
  store:
      json['store'] == null
          ? const UserReviewStoreEntity()
          : UserReviewStoreEntity.fromJson(
            json['store'] as Map<String, dynamic>,
          ),
  reviewImage: json['reviewImage'] as String?,
);

Map<String, dynamic> _$UserReviewDetailEntityToJson(
  UserReviewDetailEntity instance,
) => <String, dynamic>{
  'reviewUuid': instance.reviewUuid,
  'reviewImage': instance.reviewImage,
  'rating': instance.rating,
  'content': instance.content,
  'createdAt': const DateTimeJsonConverter().toJson(instance.createdAt),
  'store': instance.store,
};

UserReviewStoreEntity _$UserReviewStoreEntityFromJson(
  Map<String, dynamic> json,
) => UserReviewStoreEntity(
  storeUuid: json['storeUuid'] as String? ?? '',
  name: json['name'] as String? ?? '',
  address: json['address'] as String? ?? '',
  thumbnail: json['thumbnail'] as String?,
);

Map<String, dynamic> _$UserReviewStoreEntityToJson(
  UserReviewStoreEntity instance,
) => <String, dynamic>{
  'storeUuid': instance.storeUuid,
  'thumbnail': instance.thumbnail,
  'name': instance.name,
  'address': instance.address,
};
