import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/get_user_store_location_entity.g.dart';

@JsonSerializable()
class GetUserStoreLocationEntity {
  const GetUserStoreLocationEntity({
    required this.listId,
    required this.iconColorId,
    required this.storeId,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory GetUserStoreLocationEntity.fromJson(Map<String, dynamic> json) =>
      _$GetUserStoreLocationEntityFromJson(json);
  final int listId;
  final int iconColorId;
  final int storeId;
  final String name;
  final double latitude;
  final double longitude;
}
