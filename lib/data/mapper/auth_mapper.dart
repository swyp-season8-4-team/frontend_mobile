import 'package:frontend_mobile/data/entity/auth/local_login_entity.dart';
import 'package:frontend_mobile/data/request_body/auth/local_login_request_body.dart';
import 'package:frontend_mobile/domain/model/auth/local_login_model.dart';
import 'package:frontend_mobile/domain/param/auth/local_login_params.dart';

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

extension LocalLoginParamsExt on LocalLoginParams {
  LocalLoginRequestBody toBody() {
    return LocalLoginRequestBody(
      email: email,
      password: password,
      keepLoggedIn: keepLoggedIn,
    );
  }
}
