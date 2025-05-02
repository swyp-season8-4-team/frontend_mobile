class SignUpWithProfileModel {
  const SignUpWithProfileModel({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.expiresIn,
    required this.userUuid,
    required this.email,
    required this.nickname,
    required this.profileImageUrl,
    required this.deviceId,
    required this.imageError,
    required this.preferenceSet,
  });

  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int expiresIn;
  final String userUuid;
  final String email;
  final String nickname;
  final String? profileImageUrl;
  final String deviceId;
  final ImageErrorModel? imageError;
  final bool preferenceSet;
}

class ImageErrorModel {
  const ImageErrorModel({
    required this.status,
    required this.code,
    required this.message,
    required this.timestamp,
  });

  final int? status;
  final String? code;
  final String? message;
  final String? timestamp;
}
