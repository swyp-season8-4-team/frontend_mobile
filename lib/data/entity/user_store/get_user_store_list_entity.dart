import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/get_user_store_list_entity.g.dart';

//ignore_for_file: library_private_types_in_public_api

@JsonSerializable()
class GetUserStoreListEntity {
  const GetUserStoreListEntity({
    required this.listId,
    required this.userUuid,
    required this.listName,
    required this.iconColorId,
    required this.storeCount,
    this.storeData,
  });

  factory GetUserStoreListEntity.fromJson(Map<String, dynamic> json) =>
      _$GetUserStoreListEntityFromJson(json);

  final int listId;
  final String userUuid;
  final String listName;
  final int iconColorId;
  final int storeCount;
  final List<_StoreData>? storeData;
}

@JsonSerializable()
class _StoreData {
  const _StoreData({
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

  factory _StoreData.fromJson(Map<String, dynamic> json) =>
      _$StoreDataFromJson(json);
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
