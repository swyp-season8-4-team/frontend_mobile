import 'dart:io';

class AddStoreReviewParams {
  const AddStoreReviewParams({
    required this.storeUuid,
    required this.userUuid,
    required this.content,
    required this.rating,
    this.images,
  });
  final String storeUuid;
  final List<File>? images;
  final String userUuid;
  final String content;
  final int rating;
}
