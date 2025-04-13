import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/api_call.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/data/data_source/remote/user_remote_data_source.dart';
import 'package:frontend_mobile/data/entity/user/user_detail_entity.dart';
import 'package:frontend_mobile/data/mapper/user_mapper.dart';
import 'package:frontend_mobile/domain/model/user/user_detail_model.dart';
import 'package:frontend_mobile/domain/param/user/patch_me_params.dart';
import 'package:frontend_mobile/domain/repository/user_repository.dart';

final Provider<UserRepository> userRepositoryProvider =
    Provider<UserRepository>(
      (Ref ref) => UserRepositoryImpl(api: ref.read(userApiProvider)),
    );

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required this.api});

  final UserRemoteDataSource api;

  @override
  Future<Result<UserDetailModel, CustomException>> getMe() async {
    return await apiCall(
      api: () async {
        final UserDetailEntity result = await api.getMe();

        return result.toModel();
      },
    );
  }

  @override
  Future<Result<UserDetailModel, CustomException>> patchMe({
    required PatchMeParams params,
  }) async {
    return await apiCall(
      api: () async {
        final UserDetailEntity result = await api.patchMe(
          body: params.toBody(),
        );

        return result.toModel();
      },
    );
  }
}
