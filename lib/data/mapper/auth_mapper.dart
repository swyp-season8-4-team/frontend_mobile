import 'package:frontend_mobile/data/entity/auth/local_login_entity.dart';
import 'package:frontend_mobile/domain/model/auth/local_login_model.dart';

extension LocalLoginEntityExt on LocalLoginEntity {
  LocalLoginModel toModel() {
    return LocalLoginModel(
      accessToken: accessToken,
      refreshToken: refreshToken,
      tokenType: tokenType,
      expiresIn: expiresIn,
      userUuid: userUuid,
      email: email,
      nickname: nickname,
      profileImageUrl: profileImageUrl,
      preferenceSet: preferenceSet,
    );
  }
}
