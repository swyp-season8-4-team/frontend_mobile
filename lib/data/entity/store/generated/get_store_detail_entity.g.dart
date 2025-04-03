// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_store_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStoreDetailEntity _$GetStoreDetailEntityFromJson(
  Map<String, dynamic> json,
) => GetStoreDetailEntity(
  storeId: (json['storeId'] as num).toInt(),
  storeUuid: json['storeUuid'] as String,
  name: json['name'] as String,
  averageRating: (json['averageRating'] as num).toDouble(),
  storeImages:
      (json['storeImages'] as List<dynamic>).map((e) => e as String).toList(),
  ownerPickImages:
      (json['ownerPickImages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  primaryStoreLink: json['primaryStoreLink'] as String,
  storeLinks:
      (json['storeLinks'] as List<dynamic>).map((e) => e as String).toList(),
  operatingHours:
      (json['operatingHours'] as List<dynamic>)
          .map(
            (e) =>
                GetStoreOperatingHourEntity.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  holidays:
      (json['holidays'] as List<dynamic>)
          .map((e) => GetStoreHolidayEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
  topPreferences:
      (json['topPreferences'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
  address: json['address'] as String,
  phone: json['phone'] as String,
  description: json['description'] as String,
  animalYn: json['animalYn'] as bool,
  tumblerYn: json['tumblerYn'] as bool,
  parkingYn: json['parkingYn'] as bool,
  userId: (json['userId'] as num).toInt(),
  userUuid: json['userUuid'] as String,
  ownerId: (json['ownerId'] as num).toInt(),
  ownerUuid: json['ownerUuid'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  menus:
      (json['menus'] as List<dynamic>)
          .map((e) => _Menu.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalReviewCount: (json['totalReviewCount'] as num).toInt(),
  storeReviews:
      (json['storeReviews'] as List<dynamic>)
          .map((e) => _StoreReview.fromJson(e as Map<String, dynamic>))
          .toList(),
  communityReviews:
      (json['communityReviews'] as List<dynamic>)
          .map((e) => _CommunityReview.fromJson(e as Map<String, dynamic>))
          .toList(),
  mate:
      (json['mate'] as List<dynamic>)
          .map((e) => _Mate.fromJson(e as Map<String, dynamic>))
          .toList(),
  saved: json['saved'] as bool,
  savedListId: (json['savedListId'] as num).toInt(),
);

Map<String, dynamic> _$GetStoreDetailEntityToJson(
  GetStoreDetailEntity instance,
) => <String, dynamic>{
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
};

_Menu _$MenuFromJson(Map<String, dynamic> json) => _Menu(
  menuUuid: json['menuUuid'] as String,
  name: json['name'] as String,
  price: (json['price'] as num).toInt(),
  isPopular: json['isPopular'] as bool,
  description: json['description'] as String,
  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$MenuToJson(_Menu instance) => <String, dynamic>{
  'menuUuid': instance.menuUuid,
  'name': instance.name,
  'price': instance.price,
  'isPopular': instance.isPopular,
  'description': instance.description,
  'images': instance.images,
};

_StoreReview _$StoreReviewFromJson(Map<String, dynamic> json) => _StoreReview(
  reviewUuid: json['reviewUuid'] as String,
  storeId: (json['storeId'] as num).toInt(),
  userUuid: json['userUuid'] as String,
  nickname: json['nickname'] as String,
  profileImage: json['profileImage'] as String,
  content: json['content'] as String,
  rating: (json['rating'] as num).toDouble(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$StoreReviewToJson(_StoreReview instance) =>
    <String, dynamic>{
      'reviewUuid': instance.reviewUuid,
      'storeId': instance.storeId,
      'userUuid': instance.userUuid,
      'nickname': instance.nickname,
      'profileImage': instance.profileImage,
      'content': instance.content,
      'rating': instance.rating,
      'createdAt': instance.createdAt.toIso8601String(),
      'images': instance.images,
    };

_CommunityReview _$CommunityReviewFromJson(Map<String, dynamic> json) =>
    _CommunityReview(
      reviewUuid: json['reviewUuid'] as String,
      userUuid: json['userUuid'] as String,
      nickname: json['nickname'] as String,
      profileImage: json['profileImage'] as String,
      thumbnail: json['thumbnail'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CommunityReviewToJson(_CommunityReview instance) =>
    <String, dynamic>{
      'reviewUuid': instance.reviewUuid,
      'userUuid': instance.userUuid,
      'nickname': instance.nickname,
      'profileImage': instance.profileImage,
      'thumbnail': instance.thumbnail,
      'title': instance.title,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_Mate _$MateFromJson(Map<String, dynamic> json) => _Mate(
  mateUuid: json['mateUuid'] as String,
  mateCategory: json['mateCategory'] as String,
  thumbnail: json['thumbnail'] as String,
  title: json['title'] as String,
  content: json['content'] as String,
  nickname: json['nickname'] as String,
  recruitYn: json['recruitYn'] as bool,
  saved: json['saved'] as bool,
);

Map<String, dynamic> _$MateToJson(_Mate instance) => <String, dynamic>{
  'mateUuid': instance.mateUuid,
  'mateCategory': instance.mateCategory,
  'thumbnail': instance.thumbnail,
  'title': instance.title,
  'content': instance.content,
  'nickname': instance.nickname,
  'recruitYn': instance.recruitYn,
  'saved': instance.saved,
};
