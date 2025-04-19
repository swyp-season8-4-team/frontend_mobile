import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/user_store_repository_impl.dart';
import 'package:frontend_mobile/domain/param/user_store/delete_user_store_list_params.dart';
import 'package:frontend_mobile/domain/repository/user_store_repository.dart';

final Provider<DeleteUserStoreListUsecase> deleteUserStoreListUsecaseProvider =
    Provider<DeleteUserStoreListUsecase>((Ref ref) {
      return DeleteUserStoreListUsecase(
        repository: ref.read(userStoreRepositoryProvider),
      );
    });

class DeleteUserStoreListUsecase
    implements Usecase<void, DeleteUserStoreListParams> {
  const DeleteUserStoreListUsecase({required UserStoreRepository repository})
    : _repository = repository;
  final UserStoreRepository _repository;

  @override
  Future<Result<void, CustomException>> call({
    required DeleteUserStoreListParams params,
  }) async {
    return await _repository.deleteUserStoreList(params: params);
  }
}
