import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/domain/model/mate/mate_detail_model.dart';

part 'generated/patch_mate_params.g.dart';

@JsonSerializable()
class PatchMateParams {
  PatchMateParams({
    required this.mateUuid,
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

  final String mateUuid;
  final String userUuid;
  final int mateCategoryId;
  final String title;
  final String content;
  final bool recruitYn;
  final int? capacity;
  final int? storeId;
  final PlaceModel? place;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final MultipartFile? mateImage;

  Map<String, dynamic> toJson() => _$PatchMateParamsToJson(this);
}
