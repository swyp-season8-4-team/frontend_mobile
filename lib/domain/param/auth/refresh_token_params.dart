class RefreshTokenParams {
  const RefreshTokenParams({
    required this.deviceId,
    required this.refreshToken,
  });

  final String deviceId;
  final String refreshToken;
}
