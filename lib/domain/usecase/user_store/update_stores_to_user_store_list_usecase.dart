import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/user_store_repository_impl.dart';
import 'package:frontend_mobile/domain/param/user_store/update_store_to_user_store_list_params.dart';
import 'package:frontend_mobile/domain/repository/user_store_repository.dart';

final Provider<UpdateStoresToUserStoreListUsecase>
updateStoresToUserStoreListUsecaseProvider =
    Provider<UpdateStoresToUserStoreListUsecase>((Ref ref) {
      return UpdateStoresToUserStoreListUsecase(
        repository: ref.read(userStoreRepositoryProvider),
      );
    });

class UpdateStoresToUserStoreListUsecase
    implements Usecase<void, UpdateStoreToUserStoreListParams> {
  const UpdateStoresToUserStoreListUsecase({required this.repository});
  final UserStoreRepository repository;

  @override
  Future<Result<void, CustomException>> call({
    required UpdateStoreToUserStoreListParams params,
  }) async {
    return await repository.updateStoresToUserStoreList(params: params);
  }
}
