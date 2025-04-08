import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user_store_location_entity.g.dart';

@JsonSerializable()
class UserStoreLocationEntity {
  const UserStoreLocationEntity({
    required this.listId,
    required this.iconColorId,
    required this.storeId,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory UserStoreLocationEntity.fromJson(Map<String, dynamic> json) =>
      _$UserStoreLocationEntityFromJson(json);
  final int listId;
  final int iconColorId;
  final int storeId;
  final String name;
  final double latitude;
  final double longitude;
}
