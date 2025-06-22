class ImageErrorModel {
  const ImageErrorModel({
    required this.status,
    required this.code,
    required this.message,
    required this.timestamp,
  });

  final int? status;
  final String? code;
  final String? message;
  final String? timestamp;
}
