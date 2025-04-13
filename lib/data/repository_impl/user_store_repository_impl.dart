import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/api_call.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/data/data_source/remote/user_store_remote_data_source.dart';
import 'package:frontend_mobile/data/query_param/user_store/add_user_store_list_query_param.dart';
import 'package:frontend_mobile/domain/param/user_store/add_user_store_list_params.dart';
import 'package:frontend_mobile/domain/repository/user_store_repository.dart';

final Provider<UserStoreRepository> userStoreRepositoryProvider =
    Provider<UserStoreRepository>((Ref ref) {
      return UserStoreRepositoryImpl(api: ref.read(userStoreApiProvider));
    });

class UserStoreRepositoryImpl implements UserStoreRepository {
  const UserStoreRepositoryImpl({required UserStoreRemoteDataSource api})
    : _api = api;
  final UserStoreRemoteDataSource _api;

  @override
  Future<Result<void, CustomException>> addUserStoreList({
    required AddUserStoreListParams params,
  }) async {
    return await apiCall(
      api: () async {
        await _api.addUserStoreList(
          userUuid: params.userUuid,
          query: AddUserStoreListQueryParam(
            listName: params.listName,
            iconColorId: params.iconColorId,
          ),
        );
      },
    );
  }
}
