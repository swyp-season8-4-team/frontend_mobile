import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/domain/model/auth/local_login_model.dart';
import 'package:frontend_mobile/domain/param/auth/local_login_params.dart';

abstract interface class AuthRepository {
  /// Dev 로그인(domain)
  Future<Result<LocalLoginModel, CustomException>> postDevLocalLogin({
    required LocalLoginParams params,
  });

  /// 로그인(domain)
  Future<Result<LocalLoginModel, CustomException>> postLocalLogin({
    required LocalLoginParams params,
  });
}
