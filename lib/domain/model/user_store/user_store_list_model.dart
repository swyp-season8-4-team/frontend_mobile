class UserStoreListModel {
  const UserStoreListModel({
    required this.listId,
    required this.userUuid,
    required this.listName,
    required this.iconColorId,
    required this.storeCount,
    required this.storeData,
  });

  final int listId;
  final String userUuid;
  final String listName;
  final int iconColorId;
  final int storeCount;
  final List<UserStoreModel>? storeData;
}

class UserStoreModel {
  const UserStoreModel({
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
