import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/data/entity/mate/mate_detail_entity.dart';

part 'generated/patch_mate_request_body.g.dart';

@JsonSerializable()
class PatchMateRequestBody {
  PatchMateRequestBody({
    required this.userUuid,
    required this.mateCategoryId,
    required this.title,
    required this.content,
    required this.recruitYn,
    this.capacity,
    this.storeId,
    this.place,
    this.mateImage,
  });

  final String userUuid;
  final int mateCategoryId;
  final String title;
  final String content;
  final bool recruitYn;
  final int? capacity;
  final int? storeId;
  final PlaceEntity? place;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final MultipartFile? mateImage;

  Map<String, dynamic> toJson() => _$PatchMateRequestBodyToJson(this);
}
