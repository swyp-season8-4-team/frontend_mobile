import 'package:frontend_mobile/core/resource/constant.dart';

class UserStoreListDetailModel {
  const UserStoreListDetailModel({
    required this.listId,
    required this.userUuid,
    required this.listName,
    required this.iconColor,
    required this.storeCount,
    required this.storeData,
  });

  final int listId;
  final String userUuid;
  final String listName;
  final StoreListIconColor iconColor;
  final int storeCount;
  final List<UserStoreDetailModel>? storeData;
}

class UserStoreDetailModel {
  const UserStoreDetailModel({
    required this.userUuid,
    required this.storeUuid,
    required this.listId,
    required this.listName,
    required this.storeName,
    required this.storeAddress,
    required this.latitude,
    required this.longitude,
    required this.imageUrls,
    required this.userPreferences,
  });

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
