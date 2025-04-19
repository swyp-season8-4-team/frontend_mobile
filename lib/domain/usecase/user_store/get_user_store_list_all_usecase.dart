import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/user_store_repository_impl.dart';
import 'package:frontend_mobile/domain/model/user_store/user_store_list_model.dart';
import 'package:frontend_mobile/domain/param/user_store/get_user_store_list_all_params.dart';
import 'package:frontend_mobile/domain/repository/user_store_repository.dart';

final Provider<GetUserStoreListAllUsecase> getUserStoreListAllUsecaseProvider =
    Provider<GetUserStoreListAllUsecase>((Ref ref) {
      return GetUserStoreListAllUsecase(
        repository: ref.read(userStoreRepositoryProvider),
      );
    });

class GetUserStoreListAllUsecase
    implements Usecase<List<UserStoreListModel>, GetUserStoreListAllParams> {
  const GetUserStoreListAllUsecase({required UserStoreRepository repository})
    : _repository = repository;
  final UserStoreRepository _repository;

  @override
  Future<Result<List<UserStoreListModel>, CustomException>> call({
    required GetUserStoreListAllParams params,
  }) async {
    return await _repository.getUserStoreListAll(params: params);
  }
}
