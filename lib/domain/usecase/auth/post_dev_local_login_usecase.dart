import 'package:dio/dio.dart';
import 'package:frontend_mobile/core/resource/result/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/request_body/auth/local_login_request_body.dart';
import 'package:frontend_mobile/domain/model/auth/local_login_model.dart';
import 'package:frontend_mobile/domain/repository/auth_repository.dart';

class PostDevLocalLoginUsecase extends Usecase<AuthRepository> {
  /// [Dev 로그인(domain)](https://api.desserbee.com/swagger-ui/index.html#/Authentication/devlogin)
  PostDevLocalLoginUsecase({required this.body});

  final LocalLoginRequestBody body;

  @override
  Future<Result<LocalLoginModel>> call({
    required AuthRepository repository,
  }) async {
    try {
      final LocalLoginModel response = await repository.postDevLocalLogin(
        body: body,
      );

      return Result<LocalLoginModel>.success(response);
    } catch (error) {
      if (error is DioException) {
        // TODO: 에러 경우의 수 나눠서 처리해야 함
        return const Result<LocalLoginModel>.failure('dio 에러');
      }

      return const Result<LocalLoginModel>.failure('기타 에러');
    }
  }
}
