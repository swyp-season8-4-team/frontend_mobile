import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/auth_repository_impl.dart';
import 'package:frontend_mobile/domain/model/auth/local_login_model.dart';
import 'package:frontend_mobile/domain/param/auth/local_login_params.dart';
import 'package:frontend_mobile/domain/repository/auth_repository.dart';

final Provider<PostLocalLoginUsecase> postLocalLoginUsecaseProvider =
    Provider<PostLocalLoginUsecase>(
      (Ref ref) =>
          PostLocalLoginUsecase(repository: ref.read(authRepositoryProvider)),
    );

class PostLocalLoginUsecase extends Usecase<LocalLoginModel, LocalLoginParams> {
  /// 로그인(domain)
  PostLocalLoginUsecase({required this.repository});

  final AuthRepository repository;

  @override
  Future<Result<LocalLoginModel, CustomException>> call({
    required LocalLoginParams params,
  }) async {
    return await repository.postLocalLogin(params: params);
  }
}
