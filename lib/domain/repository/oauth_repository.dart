import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/domain/model/oauth/apple_model.dart';
import 'package:frontend_mobile/domain/model/oauth/kakao_model.dart';
import 'package:frontend_mobile/domain/param/oauth/apple_params.dart';
import 'package:frontend_mobile/domain/param/oauth/kakao_params.dart';

abstract interface class OauthRepository {
  /// OAuth 회원가입, 로그인
  Future<Result<KakaoModel, CustomException>> kakaoLogin({
    required KakaoParams params,
  });

  /// Apple 회원가입, 로그인
  Future<Result<AppleModel, CustomException>> appleLogin({
    required AppleParams params,
  });
}
