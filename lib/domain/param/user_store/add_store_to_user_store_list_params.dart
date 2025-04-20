class AddStoreToUserStoreListParams {
  const AddStoreToUserStoreListParams({
    required this.listId,
    required this.storeUuid,
    required this.preferenceIds,
  });
  final int listId;
  final String storeUuid;
  final List<int> preferenceIds;
}
