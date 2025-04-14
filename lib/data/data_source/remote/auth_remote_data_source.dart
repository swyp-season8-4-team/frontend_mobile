import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/network/app_dio.dart';
import 'package:frontend_mobile/data/entity/auth/local_login_entity.dart';
import 'package:frontend_mobile/data/request_body/auth/local_login_request_body.dart';
import 'package:frontend_mobile/data/request_body/auth/post_sign_up_request_body.dart';
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

  /// 회원가입
  @POST('/api/auth/signup')
  Future<LocalLoginEntity> postSignUp({
    @Header('X-Email-Verification-Token') required String emailToken,
    @Body() required PostSignUpRequestBody body,
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
