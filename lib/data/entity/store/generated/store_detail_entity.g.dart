// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../store_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreDetailEntity _$StoreDetailEntityFromJson(
  Map<String, dynamic> json,
) => StoreDetailEntity(
  storeId: (json['storeId'] as num?)?.toInt() ?? -1,
  storeUuid: json['storeUuid'] as String? ?? '',
  name: json['name'] as String? ?? '',
  tags:
      (json['tags'] as List<dynamic>?)
          ?.map((e) => StoreDetailTagEntity.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <StoreDetailTagEntity>[],
  operatingHours:
      (json['operatingHours'] as List<dynamic>?)
          ?.map(
            (e) => StoreOperatingHourEntity.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <StoreOperatingHourEntity>[],
  address: json['address'] as String? ?? '',
  phone: json['phone'] as String? ?? '',
  ownerId: (json['ownerId'] as num?)?.toInt() ?? -1,
  ownerUuid: json['ownerUuid'] as String? ?? '',
  latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
  longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
  menus:
      (json['menus'] as List<dynamic>?)
          ?.map((e) => StoreDetailMenu.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <StoreDetailMenu>[],
  totalReviewCount: (json['totalReviewCount'] as num?)?.toInt() ?? -1,
  userId: (json['userId'] as num?)?.toInt(),
  userUuid: json['userUuid'] as String?,
  storeReviews:
      (json['storeReviews'] as List<dynamic>?)
          ?.map((e) => StoreDetailReview.fromJson(e as Map<String, dynamic>))
          .toList(),
  communityReviews:
      (json['communityReviews'] as List<dynamic>?)
          ?.map(
            (e) =>
                StoreDetailCommunityReview.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  mate:
      (json['mate'] as List<dynamic>?)
          ?.map((e) => StoreDetailMate.fromJson(e as Map<String, dynamic>))
          .toList(),
  saved: json['saved'] as bool?,
  savedListId: (json['savedListId'] as num?)?.toInt(),
  notices:
      (json['notices'] as List<dynamic>?)
          ?.map(
            (e) => StoreDetailNoticeEntity.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  averageRating: (json['averageRating'] as num?)?.toDouble(),
  storeImages:
      (json['storeImages'] as List<dynamic>?)
          ?.map((e) => StoreDetailImage.fromJson(e as Map<String, dynamic>))
          .toList(),
  ownerPickImages:
      (json['ownerPickImages'] as List<dynamic>?)
          ?.map((e) => StoreDetailImage.fromJson(e as Map<String, dynamic>))
          .toList(),
  primaryStoreLink: json['primaryStoreLink'] as String?,
  storeLinks:
      (json['storeLinks'] as List<dynamic>?)?.map((e) => e as String).toList(),
  holidays:
      (json['holidays'] as List<dynamic>?)
          ?.map((e) => StoreHolidayEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
  topPreferences:
      (json['topPreferences'] as List<dynamic>?)
          ?.map(
            (e) => StoreTopPreferenceEntity.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  description: json['description'] as String?,
  descriptionUpdateTime: const DateTimeJsonConverter().fromJson(
    json['descriptionUpdateTime'] as String?,
  ),
  animalYn: json['animalYn'] as bool?,
  tumblerYn: json['tumblerYn'] as bool?,
  parkingYn: json['parkingYn'] as bool?,
);

Map<String, dynamic> _$StoreDetailEntityToJson(StoreDetailEntity instance) =>
    <String, dynamic>{
      'storeId': instance.storeId,
      'storeUuid': instance.storeUuid,
      'name': instance.name,
      'averageRating': instance.averageRating,
      'storeImages': instance.storeImages,
      'ownerPickImages': instance.ownerPickImages,
      'tags': instance.tags,
      'primaryStoreLink': instance.primaryStoreLink,
      'storeLinks': instance.storeLinks,
      'operatingHours': instance.operatingHours,
      'holidays': instance.holidays,
      'topPreferences': instance.topPreferences,
      'address': instance.address,
      'phone': instance.phone,
      'description': instance.description,
      'descriptionUpdateTime': _$JsonConverterToJson<String?, DateTime>(
        instance.descriptionUpdateTime,
        const DateTimeJsonConverter().toJson,
      ),
      'animalYn': instance.animalYn,
      'tumblerYn': instance.tumblerYn,
      'parkingYn': instance.parkingYn,
      'userId': instance.userId,
      'userUuid': instance.userUuid,
      'ownerId': instance.ownerId,
      'ownerUuid': instance.ownerUuid,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'menus': instance.menus,
      'totalReviewCount': instance.totalReviewCount,
      'storeReviews': instance.storeReviews,
      'communityReviews': instance.communityReviews,
      'mate': instance.mate,
      'saved': instance.saved,
      'savedListId': instance.savedListId,
      'notices': instance.notices,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

StoreDetailMenu _$StoreDetailMenuFromJson(Map<String, dynamic> json) =>
    StoreDetailMenu(
      menuUuid: json['menuUuid'] as String? ?? '',
      name: json['name'] as String? ?? '',
      price: (json['price'] as num?)?.toInt() ?? -1,
      isPopular: json['isPopular'] as bool?,
      description: json['description'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$StoreDetailMenuToJson(StoreDetailMenu instance) =>
    <String, dynamic>{
      'menuUuid': instance.menuUuid,
      'name': instance.name,
      'price': instance.price,
      'isPopular': instance.isPopular,
      'description': instance.description,
      'images': instance.images,
    };

StoreDetailReview _$StoreDetailReviewFromJson(Map<String, dynamic> json) =>
    StoreDetailReview(
      createdAt: const DateTimeJsonConverter().fromJson(
        json['createdAt'] as String?,
      ),
      reviewUuid: json['reviewUuid'] as String? ?? '',
      storeId: (json['storeId'] as num?)?.toInt() ?? -1,
      userUuid: json['userUuid'] as String? ?? '',
      nickname: json['nickname'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      content: json['content'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 1,
      profileImage: json['profileImage'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$StoreDetailReviewToJson(StoreDetailReview instance) =>
    <String, dynamic>{
      'reviewUuid': instance.reviewUuid,
      'storeId': instance.storeId,
      'userUuid': instance.userUuid,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'profileImage': instance.profileImage,
      'content': instance.content,
      'rating': instance.rating,
      'createdAt': const DateTimeJsonConverter().toJson(instance.createdAt),
      'images': instance.images,
    };

StoreDetailCommunityReview _$StoreDetailCommunityReviewFromJson(
  Map<String, dynamic> json,
) => StoreDetailCommunityReview(
  createdAt: const DateTimeJsonConverter().fromJson(
    json['createdAt'] as String?,
  ),
  updatedAt: const DateTimeJsonConverter().fromJson(
    json['updatedAt'] as String?,
  ),
  reviewUuid: json['reviewUuid'] as String? ?? '',
  userUuid: json['userUuid'] as String? ?? '',
  nickname: json['nickname'] as String? ?? '',
  profileImage: json['profileImage'] as String? ?? '',
  thumbnail: json['thumbnail'] as String? ?? '',
  title: json['title'] as String? ?? '',
  content: json['content'] as String? ?? '',
);

Map<String, dynamic> _$StoreDetailCommunityReviewToJson(
  StoreDetailCommunityReview instance,
) => <String, dynamic>{
  'reviewUuid': instance.reviewUuid,
  'userUuid': instance.userUuid,
  'nickname': instance.nickname,
  'profileImage': instance.profileImage,
  'thumbnail': instance.thumbnail,
  'title': instance.title,
  'content': instance.content,
  'createdAt': const DateTimeJsonConverter().toJson(instance.createdAt),
  'updatedAt': const DateTimeJsonConverter().toJson(instance.updatedAt),
};

StoreDetailMate _$StoreDetailMateFromJson(Map<String, dynamic> json) =>
    StoreDetailMate(
      mateUuid: json['mateUuid'] as String? ?? '',
      mateCategory: json['mateCategory'] as String? ?? '',
      thumbnail: json['thumbnail'] as String? ?? '',
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
      nickname: json['nickname'] as String? ?? '',
      recruitYn: json['recruitYn'] as bool? ?? false,
      saved: json['saved'] as bool?,
    );

Map<String, dynamic> _$StoreDetailMateToJson(StoreDetailMate instance) =>
    <String, dynamic>{
      'mateUuid': instance.mateUuid,
      'mateCategory': instance.mateCategory,
      'thumbnail': instance.thumbnail,
      'title': instance.title,
      'content': instance.content,
      'nickname': instance.nickname,
      'recruitYn': instance.recruitYn,
      'saved': instance.saved,
    };

StoreDetailNoticeEntity _$StoreDetailNoticeEntityFromJson(
  Map<String, dynamic> json,
) => StoreDetailNoticeEntity(
  createdAt: const DateTimeJsonConverter().fromJson(
    json['createdAt'] as String?,
  ),
  noticeId: (json['noticeId'] as num?)?.toInt() ?? -1,
  tag: json['tag'] as String? ?? '',
  title: json['title'] as String? ?? '',
  content: json['content'] as String? ?? '',
  updatedAt: const DateTimeJsonConverter().fromJson(
    json['updatedAt'] as String?,
  ),
);

Map<String, dynamic> _$StoreDetailNoticeEntityToJson(
  StoreDetailNoticeEntity instance,
) => <String, dynamic>{
  'noticeId': instance.noticeId,
  'tag': instance.tag,
  'title': instance.title,
  'content': instance.content,
  'createdAt': const DateTimeJsonConverter().toJson(instance.createdAt),
  'updatedAt': _$JsonConverterToJson<String?, DateTime>(
    instance.updatedAt,
    const DateTimeJsonConverter().toJson,
  ),
};

StoreDetailTagEntity _$StoreDetailTagEntityFromJson(
  Map<String, dynamic> json,
) => StoreDetailTagEntity(
  id: (json['id'] as num?)?.toInt() ?? -1,
  name: json['name'] as String? ?? '',
  category:
      json['category'] == null
          ? null
          : StoreDetailTagCategoryEntity.fromJson(
            json['category'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$StoreDetailTagEntityToJson(
  StoreDetailTagEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'category': instance.category,
};

StoreDetailTagCategoryEntity _$StoreDetailTagCategoryEntityFromJson(
  Map<String, dynamic> json,
) => StoreDetailTagCategoryEntity(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
);

Map<String, dynamic> _$StoreDetailTagCategoryEntityToJson(
  StoreDetailTagCategoryEntity instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};

StoreDetailImage _$StoreDetailImageFromJson(Map<String, dynamic> json) =>
    StoreDetailImage(
      id: (json['id'] as num?)?.toInt(),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$StoreDetailImageToJson(StoreDetailImage instance) =>
    <String, dynamic>{'id': instance.id, 'url': instance.url};
