class RefreshTokenModel {
  const RefreshTokenModel({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.deviceId,
  });

  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final String? deviceId;
}
