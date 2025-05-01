import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/mate_detail_model.freezed.dart';
part 'generated/mate_detail_model.g.dart';

@freezed
class MateDetailModel with _$MateDetailModel {
  const factory MateDetailModel({
    required String mateUuid,
    required int storeId,
    required String userUuid,
    required int capacity,
    required int currentMemberCount,
    required String nickname,
    required String title,
    required String content,
    required bool recruitYn,
    required String mateImage,
    required String profileImage,
    required String createdAt,
    required bool saved,
    required String applyStatus,
    required String gender,
    required String mateCategory,
    PlaceModel? place,
    String? updatedAt,
  }) = _MateDetailModel;
}

@JsonSerializable()
class PlaceModel {
  factory PlaceModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceModelFromJson(json);

  const PlaceModel({
    required this.placeName,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  final String? placeName;
  final String? address;
  final int? latitude;
  final int? longitude;

  Map<String, dynamic> toJson() => _$PlaceModelToJson(this);
}
