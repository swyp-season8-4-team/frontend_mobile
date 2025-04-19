class UpdateUserStoreListParams {
  const UpdateUserStoreListParams({
    required this.newName,
    required this.newIconColorId,
    required this.listId,
  });
  final String newName;
  final int newIconColorId;
  final int listId;
}
