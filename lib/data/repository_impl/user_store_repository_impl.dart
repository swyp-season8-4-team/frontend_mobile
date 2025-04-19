import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/api_call.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/data/data_source/remote/user_store_remote_data_source.dart';
import 'package:frontend_mobile/data/entity/user_store/user_store_list_entity.dart';
import 'package:frontend_mobile/data/mapper/user_store_mapper.dart';
import 'package:frontend_mobile/data/query_param/user_store/add_user_store_list_query_param.dart';
import 'package:frontend_mobile/domain/model/user_store/user_store_list_model.dart';
import 'package:frontend_mobile/domain/param/user_store/add_user_store_list_params.dart';
import 'package:frontend_mobile/domain/param/user_store/delete_store_from_user_store_list_params.dart';
import 'package:frontend_mobile/domain/param/user_store/delete_user_store_list_params.dart';
import 'package:frontend_mobile/domain/param/user_store/get_stores_by_user_store_list_params.dart';
import 'package:frontend_mobile/domain/param/user_store/get_user_store_list_all_params.dart';
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

  @override
  Future<Result<List<UserStoreListModel>, CustomException>>
  getUserStoreListAll({required GetUserStoreListAllParams params}) async {
    return await apiCall(
      api: () async {
        final List<UserStoreListEntity> result = await _api.getUserStoreListAll(
          userUuid: params.userUuid,
        );
        return result.map((UserStoreListEntity e) => e.toModel()).toList();
      },
    );
  }

  @override
  Future<Result<UserStoreListModel, CustomException>> getStoresByUserStoreList({
    required GetStoresByUserStoreListParams params,
  }) async {
    return await apiCall(
      api: () async {
        final UserStoreListEntity result = await _api.getStoresByUserStoreList(
          listId: params.listId,
        );
        return result.toModel();
      },
    );
  }

  @override
  Future<Result<void, CustomException>> deleteStoreFromUserStoreList({
    required DeleteStoreFromUserStoreListParams params,
  }) async {
    return await apiCall(
      api: () async {
        return await _api.deleteStoreFromUserStoreList(
          listId: params.listId,
          storeUuid: params.storeUuid,
        );
      },
    );
  }

  @override
  Future<Result<void, CustomException>> deleteUserStoreList({
    required DeleteUserStoreListParams params,
  }) async {
    return await apiCall(
      api: () async {
        return await _api.deleteUserStoreList(listId: params.listId);
      },
    );
  }
}
