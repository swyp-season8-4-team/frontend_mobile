import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/domain/model/mate/mate_detail_model.dart';

part 'generated/post_mate_params.g.dart';

@JsonSerializable()
class PostMateParams {
  PostMateParams({
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
  final PlaceModel? place;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final MultipartFile? mateImage;

  Map<String, dynamic> toJson() => _$PostMateParamsToJson(this);
}
