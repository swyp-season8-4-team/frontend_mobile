import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/user_store_repository_impl.dart';
import 'package:frontend_mobile/domain/param/user_store/add_store_to_user_store_list_params.dart';
import 'package:frontend_mobile/domain/repository/user_store_repository.dart';

final Provider<AddStoreToUserStoreListUsecase>
addStoreToUserStoreListUsecaseProvider =
    Provider<AddStoreToUserStoreListUsecase>((Ref ref) {
      return AddStoreToUserStoreListUsecase(
        repository: ref.read(userStoreRepositoryProvider),
      );
    });

class AddStoreToUserStoreListUsecase
    implements Usecase<void, AddStoreToUserStoreListParams> {
  const AddStoreToUserStoreListUsecase({
    required UserStoreRepository repository,
  }) : _repository = repository;
  final UserStoreRepository _repository;

  @override
  Future<Result<void, CustomException>> call({
    required AddStoreToUserStoreListParams params,
  }) async {
    return await _repository.addStoreToUserStoreList(params: params);
  }
}
