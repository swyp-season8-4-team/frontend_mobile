class UpdateStoreToUserStoreListParams {
  const UpdateStoreToUserStoreListParams({
    required this.storeUuid,
    required this.selectedLists,
  });
  final String storeUuid;
  //ignore: library_private_types_in_public_api
  final List<UpdateStoreSelectedList> selectedLists;
}

class UpdateStoreSelectedList {
  const UpdateStoreSelectedList({
    required this.listId,
    required this.userPreferences,
  });
  final int listId;
  final List<int>? userPreferences;
}
