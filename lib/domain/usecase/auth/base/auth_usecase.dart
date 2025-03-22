import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/model.dart';
import 'package:frontend_mobile/core/resource/repository.dart';
import 'package:frontend_mobile/core/resource/result/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/auth_repository_impl.dart';

final Provider<AuthUsecase> authUsecaseProvider = Provider<AuthUsecase>(
  (Ref ref) => AuthUsecase(repository: ref.read(authRepositoryProvider)),
);

class AuthUsecase {
  AuthUsecase({required this.repository});

  final Repository repository;

  Future<Result<T>> execute<T extends Model>({
    required Usecase<Repository> usecase,
  }) async {
    final Result<Model> result = await usecase(repository: repository);

    if (result is Result<T>) {
      return result;
    }

    return Result<T>.failure('타입 불일치');
  }
}
