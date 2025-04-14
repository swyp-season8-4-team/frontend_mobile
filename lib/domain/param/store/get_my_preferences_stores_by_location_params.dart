class GetMyPreferencesStoresByLocationParams {
  const GetMyPreferencesStoresByLocationParams({
    required this.latitude,
    required this.longitude,
    required this.radius,
  });
  final double latitude;
  final double longitude;
  final double radius;
}
