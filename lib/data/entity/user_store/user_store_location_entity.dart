import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user_store_location_entity.g.dart';

@JsonSerializable()
class UserStoreLocationEntity {
  const UserStoreLocationEntity({
    this.listId = -1,
    this.iconColorId = 1,
    this.storeId = -1,
    this.name = '',
    this.latitude = 0,
    this.longitude = 0,
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
