import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user_store_list_entity.g.dart';

@JsonSerializable()
class UserStoreListEntity {
  factory UserStoreListEntity.fromJson(Map<String, dynamic> json) =>
      _$UserStoreListEntityFromJson(json);
  const UserStoreListEntity({
    this.listId = -1,
    this.userUuid = '',
    this.listName = '',
    this.iconColorId = 1,
    this.storeCount = -1,
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
    this.listId = -1,
    this.iconColorId = 1,
    this.storeId = -1,
    this.storeUuid = '',
    this.name = '',
    this.latitude = 0,
    this.longitude = 0,
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
