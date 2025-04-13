import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/mate_detail_entity.g.dart';

@JsonSerializable()
class MateDetailEntity {
  const MateDetailEntity({
    this.mateUuid = '',
    this.storeId = -1,
    this.userUuid = '',
    this.nickname = '',
    this.title = '',
    this.content = '',
    this.recruitYn = false,
    this.mateImage = '',
    this.profileImage = '',
    this.place = const PlaceEntity(),
    this.createdAt = '',
    this.updatedAt = '',
    this.saved = false,
    this.applyStatus = '',
    this.gender = '',
    this.mateCategory = '',
  });

  factory MateDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$MateDetailEntityFromJson(json);

  final String mateUuid;
  final int storeId;
  final String userUuid;
  final String nickname;
  final String title;
  final String content;
  final bool recruitYn;
  final String mateImage;
  final String profileImage;
  final PlaceEntity place;
  final String createdAt;
  final String updatedAt;
  final bool saved;
  final String applyStatus;
  final String gender;
  final String mateCategory;
}

@JsonSerializable()
class PlaceEntity {
  const PlaceEntity({
    this.placeName = '',
    this.address = '',
    this.latitude = -1,
    this.longitude = -1,
  });

  factory PlaceEntity.fromJson(Map<String, dynamic> json) =>
      _$PlaceEntityFromJson(json);

  final String placeName;
  final String address;
  final int latitude;
  final int longitude;
}
