import 'dart:io';

class AddStoreReviewParams {
  const AddStoreReviewParams({
    required this.storeUuid,
    required this.images,
    required this.userUuid,
    required this.content,
    required this.rating,
  });
  final String storeUuid;
  final List<File> images;
  final String userUuid;
  final String content;
  final int rating;
}
