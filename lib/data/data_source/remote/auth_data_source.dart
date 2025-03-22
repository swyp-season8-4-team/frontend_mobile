import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/data/data_source/mock/auth_mock_data_source.dart';
import 'package:frontend_mobile/data/entity/auth/local_login_entity.dart';
import 'package:frontend_mobile/data/request_body/auth/local_login_request_body.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_data_source.g.dart';

final Provider<AuthApi> authApiProvider = Provider<AuthApi>((Ref ref) {
  return AuthMockApi();

  // final Dio dio = Dio();
  // return AuthApi(dio);
});

@RestApi(baseUrl: 'http://api.desserbee.com/')
abstract class AuthApi {
  factory AuthApi(Dio dio, {String? baseUrl}) = _AuthApi;

  /// [Dev 로그인(data)](https://api.desserbee.com/swagger-ui/index.html#/Authentication/devlogin)
  @POST('/api/auth/dev/login')
  Future<LocalLoginEntity> postDevLocalLogin({
    @Body() required LocalLoginRequestBody body,
  });
}
