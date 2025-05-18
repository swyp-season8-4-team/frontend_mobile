import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/user_repository_impl.dart';
import 'package:frontend_mobile/domain/param/user/unblock_user_params.dart';
import 'package:frontend_mobile/domain/repository/user_repository.dart';

final Provider<UnblockUserUsecase> unblockUserUsecaseProvider =
    Provider<UnblockUserUsecase>((Ref ref) {
      return UnblockUserUsecase(repository: ref.read(userRepositoryProvider));
    });

class UnblockUserUsecase implements Usecase<void, UnblockUserParams> {
  const UnblockUserUsecase({required UserRepository repository})
    : _repository = repository;
  final UserRepository _repository;

  @override
  Future<Result<void, CustomException>> call({
    required UnblockUserParams params,
  }) async {
    return await _repository.unblockUser(params: params);
  }
}
