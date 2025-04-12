import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/api_call.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/data/data_source/remote/auth_remote_data_source.dart';
import 'package:frontend_mobile/data/entity/auth/local_login_entity.dart';
import 'package:frontend_mobile/data/mapper/auth_mapper.dart';
import 'package:frontend_mobile/domain/model/auth/local_login_model.dart';
import 'package:frontend_mobile/domain/param/auth/local_login_params.dart';
import 'package:frontend_mobile/domain/repository/auth_repository.dart';

final Provider<AuthRepository> authRepositoryProvider =
    Provider<AuthRepository>(
      (Ref ref) => AuthRepositoryImpl(api: ref.read(authApiProvider)),
    );

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.api});

  final AuthRemoteDataSource api;

  @override
  Future<Result<LocalLoginModel, CustomException>> postDevLocalLogin({
    required LocalLoginParams params,
  }) async {
    return await apiCall(
      api: () async {
        final LocalLoginEntity result = await api.postDevLocalLogin(
          body: params.toBody(),
        );
        return result.toModel();
      },
    );
  }

  @override
  Future<Result<LocalLoginModel, CustomException>> postLocalLogin({
    required LocalLoginParams params,
  }) async {
    return await apiCall(
      api: () async {
        final LocalLoginEntity result = await api.postLocalLogin(
          body: params.toBody(),
        );
        return result.toModel();
      },
    );
  }
}
