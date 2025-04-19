import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/user_store_repository_impl.dart';
import 'package:frontend_mobile/domain/param/user_store/add_user_store_list_params.dart';
import 'package:frontend_mobile/domain/repository/user_store_repository.dart';

final Provider<AddUserStoreListUsecase> addUserStoreListUsecaseProvider =
    Provider<AddUserStoreListUsecase>((Ref ref) {
      return AddUserStoreListUsecase(
        repository: ref.read(userStoreRepositoryProvider),
      );
    });

class AddUserStoreListUsecase implements Usecase<void, AddUserStoreListParams> {
  const AddUserStoreListUsecase({required UserStoreRepository repository})
    : _repository = repository;
  final UserStoreRepository _repository;

  @override
  Future<Result<void, CustomException>> call({
    required AddUserStoreListParams params,
  }) async {
    return await _repository.addUserStoreList(params: params);
  }
}
