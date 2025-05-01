import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/mate_detail_model.g.dart';

class MateDetailModel {
  const MateDetailModel({
    required this.mateUuid,
    required this.storeId,
    required this.userUuid,
    required this.capacity,
    required this.currentMemberCount,
    required this.nickname,
    required this.title,
    required this.content,
    required this.recruitYn,
    required this.mateImage,
    required this.profileImage,
    required this.place,
    required this.createdAt,
    required this.updatedAt,
    required this.saved,
    required this.applyStatus,
    required this.gender,
    required this.mateCategory,
  });

  final String mateUuid;
  final int storeId;
  final String userUuid;
  final int capacity;
  final int currentMemberCount;
  final String nickname;
  final String title;
  final String content;
  final bool recruitYn;
  final String mateImage;
  final String profileImage;
  final PlaceModel? place;
  final String createdAt;
  final String? updatedAt;
  final bool saved;
  final String applyStatus;
  final String gender;
  final String mateCategory;
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
