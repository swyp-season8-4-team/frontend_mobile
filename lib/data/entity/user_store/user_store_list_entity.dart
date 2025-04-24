import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user_store_list_entity.g.dart';

@JsonSerializable()
class UserStoreListEntity {
  factory UserStoreListEntity.fromJson(Map<String, dynamic> json) =>
      _$UserStoreListEntityFromJson(json);
  const UserStoreListEntity({
    required this.listId,
    required this.userUuid,
    required this.listName,
    required this.iconColorId,
    required this.storeCount,
    this.storeData,
  });

  final int listId;
  final String userUuid;
  final String listName;
  final int iconColorId;
  final int storeCount;
  final List<UserStoreDataEntity>? storeData;
}

@JsonSerializable()
class UserStoreDataEntity {
  const UserStoreDataEntity({
    required this.listId,
    required this.iconColorId,
    required this.storeId,
    required this.storeUuid,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory UserStoreDataEntity.fromJson(Map<String, dynamic> json) =>
      _$UserStoreDataEntityFromJson(json);
  final int listId;
  final int iconColorId;
  final int storeId;
  final String storeUuid;
  final String name;
  final double latitude;
  final double longitude;
}
