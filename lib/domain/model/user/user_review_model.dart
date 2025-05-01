class UserReviewModel {
  const UserReviewModel({required this.reviewCount, required this.reviews});

  final int reviewCount;
  final List<UserReviewDetailModel> reviews;
}

class UserReviewDetailModel {
  const UserReviewDetailModel({
    required this.reviewUuid,
    required this.rating,
    required this.content,
    required this.createdAt,
    required this.store,
    required this.reviewImage,
  });
  final String reviewUuid;
  final String? reviewImage;
  final double rating;
  final String content;
  final DateTime createdAt;
  final UserReviewStoreModel store;
}

class UserReviewStoreModel {
  const UserReviewStoreModel({
    required this.storeUuid,
    required this.name,
    required this.address,
    required this.thumbnail,
  });
  final String storeUuid;
  final String? thumbnail;
  final String name;
  final String address;
}
