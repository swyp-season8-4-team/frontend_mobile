import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/params/no_params.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/user_repository_impl.dart';
import 'package:frontend_mobile/domain/repository/user_repository.dart';

final Provider<DeleteMeUsecase> deleteMeUsecaseProvider =
    Provider<DeleteMeUsecase>((Ref ref) {
      return DeleteMeUsecase(repository: ref.read(userRepositoryProvider));
    });

class DeleteMeUsecase implements Usecase<void, NoParams> {
  const DeleteMeUsecase({required UserRepository repository})
    : _repository = repository;
  final UserRepository _repository;

  @override
  Future<Result<void, CustomException>> call({required NoParams params}) async {
    return await _repository.deleteMe(params: params);
  }
}
