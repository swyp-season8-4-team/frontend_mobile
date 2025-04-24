class UserStoreListModel {
  const UserStoreListModel({
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
  final List<UserStoreDataModel>? storeData;
}

class UserStoreDataModel {
  const UserStoreDataModel({
    required this.listId,
    required this.iconColorId,
    required this.storeId,
    required this.storeUuid,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  final int listId;
  final int iconColorId;
  final int storeId;
  final String storeUuid;
  final String name;
  final double latitude;
  final double longitude;
}
