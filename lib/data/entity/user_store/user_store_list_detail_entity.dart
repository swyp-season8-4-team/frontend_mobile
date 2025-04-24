import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user_store_list_detail_entity.g.dart';

//ignore_for_file: library_private_types_in_public_api

@JsonSerializable()
class UserStoreListDetailEntity {
  const UserStoreListDetailEntity({
    required this.listId,
    required this.userUuid,
    required this.listName,
    required this.iconColorId,
    required this.storeCount,
    this.storeData,
  });

  factory UserStoreListDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$UserStoreListDetailEntityFromJson(json);

  final int listId;
  final String userUuid;
  final String listName;
  final int iconColorId;
  final int storeCount;
  final List<UserStoreDataDetailEntity>? storeData;
}

@JsonSerializable()
class UserStoreDataDetailEntity {
  const UserStoreDataDetailEntity({
    required this.userUuid,
    required this.storeUuid,
    required this.listId,
    required this.listName,
    required this.storeName,
    required this.storeAddress,
    required this.latitude,
    required this.longitude,
    this.imageUrls,
    this.userPreferences,
  });

  factory UserStoreDataDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$UserStoreDataDetailEntityFromJson(json);

  final String userUuid;
  final String storeUuid;
  final int listId;
  final String listName;
  final String storeName;
  final String storeAddress;
  final double latitude;
  final double longitude;
  final List<String>? imageUrls;
  final List<int>? userPreferences;
}
