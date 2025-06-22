import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/image_error_entity.g.dart';

@JsonSerializable()
class ImageErrorEntity {
  const ImageErrorEntity({
    this.status,
    this.code,
    this.message,
    this.timestamp,
  });

  factory ImageErrorEntity.fromJson(Map<String, dynamic> json) =>
      _$ImageErrorEntityFromJson(json);

  final int? status;
  final String? code;
  final String? message;
  final String? timestamp;
}
