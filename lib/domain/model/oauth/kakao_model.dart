import 'package:frontend_mobile/domain/model/common/image_error_model.dart';

class KakaoModel {
  const KakaoModel({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.refreshExpiresIn,
    required this.expiresIn,
    required this.userUuid,
    required this.email,
    required this.nickname,
    required this.profileImageUrl,
    required this.deviceId,
    required this.fromApp,
    required this.imageError,
    required this.preferenceSet,
  });

  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int refreshExpiresIn;
  final int expiresIn;
  final String userUuid;
  final String email;
  final String nickname;
  final String? profileImageUrl;
  final String deviceId;
  final bool fromApp;
  final ImageErrorModel? imageError;
  final bool preferenceSet;
}
