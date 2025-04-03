import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/data/entity/store/get_store_operating_hour_entity.dart';

part 'generated/get_store_from_map_entity.g.dart';

@JsonSerializable()
class GetStoreFromMapEntity {
  const GetStoreFromMapEntity({
    required this.storeId,
    required this.storeUuid,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.operatingHours,
    required this.shortReviewCount,
    required this.tags,
    required this.storeImage,
  });

  factory GetStoreFromMapEntity.fromJson(Map<String, dynamic> json) =>
      _$GetStoreFromMapEntityFromJson(json);
  final int storeId;
  final String storeUuid;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final List<GetStoreOperatingHourEntity> operatingHours;
  final int shortReviewCount;
  final List<String> tags;
  final String storeImage;
}
