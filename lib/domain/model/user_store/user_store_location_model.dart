class UserStoreLocationModel {
  const UserStoreLocationModel({
    required this.listId,
    required this.iconColorId,
    required this.storeId,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  final int listId;
  final int iconColorId;
  final int storeId;
  final String name;
  final double latitude;
  final double longitude;
}
