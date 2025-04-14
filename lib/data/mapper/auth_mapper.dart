import 'package:frontend_mobile/data/entity/auth/local_login_entity.dart';
import 'package:frontend_mobile/data/header/auth/post_sign_up_header.dart';
import 'package:frontend_mobile/data/request_body/auth/local_login_request_body.dart';
import 'package:frontend_mobile/data/request_body/auth/post_sign_up_request_body.dart';
import 'package:frontend_mobile/domain/model/auth/local_login_model.dart';
import 'package:frontend_mobile/domain/param/auth/local_login_params.dart';
import 'package:frontend_mobile/domain/param/auth/post_sign_up_params.dart';

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
      deviceId: deviceId,
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

extension PostSignUpParamsExt on PostSignUpParams {
  PostSignUpHeader toHeader() {
    return PostSignUpHeader(emailToken: emailToken);
  }

  PostSignUpRequestBody toBody() {
    return PostSignUpRequestBody(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      nickname: nickname,
      name: name,
      phoneNumber: phoneNumber,
      address: address,
      gender: gender,
      preferenceIds: preferenceIds,
      role: role,
    );
  }
}
