import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/domain/model/auth/local_login_model.dart';
import 'package:frontend_mobile/domain/model/auth/password_reset_model.dart';
import 'package:frontend_mobile/domain/model/auth/sign_up_with_profile_model.dart';
import 'package:frontend_mobile/domain/param/auth/local_login_params.dart';
import 'package:frontend_mobile/domain/param/auth/password_reset_params.dart';
import 'package:frontend_mobile/domain/param/auth/post_sign_up_with_profile_params.dart';

abstract interface class AuthRepository {
  /// 프로필 이미지 포함 회원가입
  Future<Result<SignUpWithProfileModel, CustomException>>
  postSignUpWithProfile({required PostSignUpWithProfileParams params});

  /// 비밀번호 재설정
  Future<Result<PasswordResetModel, CustomException>> postPasswordReset({
    required PasswordResetParams params,
  });

  /// Dev 로그인(domain)
  Future<Result<LocalLoginModel, CustomException>> postDevLocalLogin({
    required LocalLoginParams params,
  });

  /// 로그인(domain)
  Future<Result<LocalLoginModel, CustomException>> postLocalLogin({
    required LocalLoginParams params,
  });
}
