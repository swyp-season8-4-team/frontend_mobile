class GetStoresByLocationParams {
  const GetStoresByLocationParams({
    required this.latitude,
    required this.longitude,
    required this.radius,
    this.preferenceTagIds,
    this.searchKeyword,
  });
  final double latitude;
  final double longitude;
  final double radius;
  final List<int>? preferenceTagIds;
  final String? searchKeyword;
}
