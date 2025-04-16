import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/domain/model/user_store/user_store_list_model.dart';
import 'package:frontend_mobile/domain/param/user_store/add_user_store_list_params.dart';
import 'package:frontend_mobile/domain/param/user_store/get_user_store_list_all_params.dart';

abstract interface class UserStoreRepository {
  Future<Result<void, CustomException>> addUserStoreList({
    required AddUserStoreListParams params,
  });

  Future<Result<List<UserStoreListModel>, CustomException>>
  getUserStoreListAll({required GetUserStoreListAllParams params});
}
