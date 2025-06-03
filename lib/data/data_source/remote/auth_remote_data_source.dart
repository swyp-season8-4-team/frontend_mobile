import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/network/app_dio.dart';
import 'package:frontend_mobile/data/entity/auth/local_login_entity.dart';
import 'package:frontend_mobile/data/entity/auth/password_reset_entity.dart';
import 'package:frontend_mobile/data/entity/auth/refresh_token_entity.dart';
import 'package:frontend_mobile/data/entity/auth/sign_up_with_profile_entity.dart';
import 'package:frontend_mobile/data/request_body/auth/local_login_request_body.dart';
import 'package:frontend_mobile/data/request_body/auth/password_reset_request_body.dart';
import 'package:retrofit/retrofit.dart';

part 'generated/auth_remote_data_source.g.dart';

final Provider<AuthRemoteDataSource> authApiProvider =
    Provider<AuthRemoteDataSource>((Ref ref) {
      // return AuthMockDataSource();

      final Dio dio = ref.read(appDioProvider);
      return AuthRemoteDataSource(dio);
    });

@RestApi()
abstract interface class AuthRemoteDataSource {
  factory AuthRemoteDataSource(Dio dio, {String? baseUrl}) =
      _AuthRemoteDataSource;

  /// 프로필 이미지 포함 회원가입
  @POST('/api/auth/signup-with-profile')
  @MultiPart()
  Future<SignUpWithProfileEntity> postSignUp({
    @Header('X-Email-Verification-Token') required String emailToken,
    @Body() required FormData formData,
  });

  /// 비밀번호 재설정
  @POST('/api/auth/password/reset')
  Future<PasswordResetEntity> postPasswordReset({
    @Header('X-Email-Verification-Token') required String emailToken,
    @Body() required PasswordResetRequestBody body,
  });

  /// Dev 로그인(data)
  @POST('/api/auth/dev/login')
  Future<LocalLoginEntity> postDevLocalLogin({
    @Body() required LocalLoginRequestBody body,
  });

  /// 로그인(data)
  @POST('/api/auth/login')
  Future<LocalLoginEntity> postLocalLogin({
    @Body() required LocalLoginRequestBody body,
  });
}
