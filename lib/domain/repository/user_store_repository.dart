import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/domain/param/user_store/add_user_store_list_params.dart';

abstract interface class UserStoreRepository {
  Future<Result<void, CustomException>> addUserStoreList({
    required AddUserStoreListParams params,
  });
}
