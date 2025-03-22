import 'package:frontend_mobile/core/resource/repository.dart';
import 'package:frontend_mobile/data/request_body/auth/local_login_request_body.dart';
import 'package:frontend_mobile/domain/model/auth/local_login_model.dart';

abstract class AuthRepository extends Repository {
  /// [Dev 로그인(domain)](https://api.desserbee.com/swagger-ui/index.html#/Authentication/devlogin)
  Future<LocalLoginModel> postDevLocalLogin({
    required LocalLoginRequestBody body,
  });
}
