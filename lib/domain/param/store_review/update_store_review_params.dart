import 'dart:io';

class UpdateStoreReviewParams {
  const UpdateStoreReviewParams({
    required this.storeUuid,
    required this.reviewUuid,
    required this.content,
    required this.rating,
    this.newImages,
  });
  final String storeUuid;
  final String reviewUuid;
  final List<File>? newImages;
  final String content;
  final int rating;
}
