import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/data/entity/mate/mate_detail_entity.dart';

part 'generated/post_mate_request_body.g.dart';

@JsonSerializable()
class PostMateRequestBody {
  PostMateRequestBody({
    required this.userUuid,
    required this.mateCategoryId,
    required this.capacity,
    required this.title,
    required this.content,
    required this.recruitYn,
    this.storeId,
    this.place,
    this.mateImage,
  });

  final String userUuid;
  final int mateCategoryId;
  final int capacity;
  final String title;
  final String content;
  final bool recruitYn;
  final int? storeId;
  final PlaceEntity? place;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final MultipartFile? mateImage;

  Map<String, dynamic> toJson() => _$PostMateRequestBodyToJson(this);
}
