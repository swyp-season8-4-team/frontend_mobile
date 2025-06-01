import 'package:dio/dio.dart';
import 'package:frontend_mobile/data/entity/auth/local_login_entity.dart';
import 'package:frontend_mobile/data/entity/auth/password_reset_entity.dart';
import 'package:frontend_mobile/data/entity/auth/sign_up_with_profile_entity.dart';
import 'package:frontend_mobile/data/request_body/auth/local_login_request_body.dart';
import 'package:frontend_mobile/data/request_body/auth/password_reset_request_body.dart';
import 'package:frontend_mobile/data/request_body/auth/post_sign_up_with_profile_request_body.dart';
import 'package:frontend_mobile/data/request_header/auth/password_reset_header.dart';
import 'package:frontend_mobile/data/request_header/auth/post_sign_up_with_profile_header.dart';
import 'package:frontend_mobile/domain/model/auth/local_login_model.dart';
import 'package:frontend_mobile/domain/model/auth/password_reset_model.dart';
import 'package:frontend_mobile/domain/model/auth/sign_up_with_profile_model.dart';
import 'package:frontend_mobile/domain/param/auth/local_login_params.dart';
import 'package:frontend_mobile/domain/param/auth/password_reset_params.dart';
import 'package:frontend_mobile/domain/param/auth/post_sign_up_with_profile_params.dart';

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

extension SignUpWithProfileEntityExt on SignUpWithProfileEntity {
  SignUpWithProfileModel toModel() {
    return SignUpWithProfileModel(
      accessToken: accessToken,
      refreshToken: refreshToken,
      tokenType: tokenType,
      expiresIn: expiresIn,
      userUuid: userUuid,
      email: email,
      nickname: nickname,
      profileImageUrl: profileImageUrl,
      deviceId: deviceId,
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

extension PostSignUpWithProfileParamsExt on PostSignUpWithProfileParams {
  PostSignUpWithProfileHeader toHeader() {
    return PostSignUpWithProfileHeader(emailToken: emailToken);
  }

  PostSignUpWithProfileRequestBody toBody() {
    return PostSignUpWithProfileRequestBody(
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
      profileImage: profileImage,
    );
  }
}

extension PostSignUpWithProfileRequestBodyExt
    on PostSignUpWithProfileRequestBody {
  FormData toFormData() {
    final Map<String, dynamic> map = <String, dynamic>{
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'nickname': nickname,
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
      'gender': gender,
      'preferenceIds': preferenceIds,
      'role': role,
      'profileImage': profileImage,
    };

    final Map<String, dynamic> filteredMap = <String, dynamic>{};

    map.forEach((String key, dynamic value) {
      if (value != null) {
        filteredMap[key] = value;
      }
    });

    return FormData.fromMap(filteredMap);
  }
}

extension PasswordResetEntityExt on PasswordResetEntity {
  PasswordResetModel toModel() {
    return PasswordResetModel(success: success, message: message);
  }
}

extension PasswordResetParamsExt on PasswordResetParams {
  PasswordResetHeader toHeader() {
    return PasswordResetHeader(emailToken: emailToken);
  }

  PasswordResetRequestBody toBody() {
    return PasswordResetRequestBody(
      email: email,
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}
