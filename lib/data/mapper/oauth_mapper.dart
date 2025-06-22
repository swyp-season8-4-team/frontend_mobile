import 'package:frontend_mobile/data/entity/common/image_error_entity.dart';
import 'package:frontend_mobile/data/entity/oauth/apple_entity.dart';
import 'package:frontend_mobile/data/entity/oauth/kakao_entity.dart';
import 'package:frontend_mobile/data/request_body/oauth/apple_request_body.dart';
import 'package:frontend_mobile/data/request_body/oauth/kakao_request_body.dart';
import 'package:frontend_mobile/domain/model/common/image_error_model.dart';
import 'package:frontend_mobile/domain/model/oauth/apple_model.dart';
import 'package:frontend_mobile/domain/model/oauth/kakao_model.dart';
import 'package:frontend_mobile/domain/param/oauth/apple_params.dart';
import 'package:frontend_mobile/domain/param/oauth/kakao_params.dart';

extension KakaoEntityExt on KakaoEntity {
  KakaoModel toModel() {
    return KakaoModel(
      accessToken: accessToken,
      refreshToken: refreshToken,
      tokenType: tokenType,
      refreshExpiresIn: refreshExpiresIn,
      expiresIn: expiresIn,
      userUuid: userUuid,
      email: email,
      nickname: nickname,
      profileImageUrl: profileImageUrl,
      deviceId: deviceId,
      fromApp: fromApp,
      imageError: imageError?.toModel(),
      preferenceSet: preferenceSet,
    );
  }
}

extension ImageErrorEntityExt on ImageErrorEntity {
  ImageErrorModel toModel() {
    return ImageErrorModel(
      status: status,
      code: code,
      message: message,
      timestamp: timestamp,
    );
  }
}

extension KakaoParamsExt on KakaoParams {
  KakaoRequestBody toBody() {
    return KakaoRequestBody(code: code, provider: provider);
  }
}

extension AppleEntityExt on AppleEntity {
  AppleModel toModel() {
    return AppleModel(
      accessToken: accessToken,
      refreshToken: refreshToken,
      tokenType: tokenType,
      refreshExpiresIn: refreshExpiresIn,
      expiresIn: expiresIn,
      userUuid: userUuid,
      email: email,
      nickname: nickname,
      profileImageUrl: profileImageUrl,
      deviceId: deviceId,
      fromApp: fromApp,
      imageError: imageError?.toModel(),
      preferenceSet: preferenceSet,
    );
  }
}

extension AppleParamsExt on AppleParams {
  AppleRequestBody toBody() {
    return AppleRequestBody(
      code: code,
      state: state,
      id_token: id_token,
      user: user.toBody(),
    );
  }
}

extension UserAppleParamExt on UserAppleParams {
  UserAppleRequestBody toBody() {
    return UserAppleRequestBody(email: email, name: name.toBody());
  }
}

extension NameAppleParamsExt on NameAppleParams {
  NameAppleRequestBody toBody() {
    return NameAppleRequestBody(firstName: firstName, lastName: lastName);
  }
}
