import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/data/data_source/remote/auth_data_source.dart';
import 'package:frontend_mobile/data/entity/auth/local_login_entity.dart';
import 'package:frontend_mobile/data/mapper/auth_mapper.dart';
import 'package:frontend_mobile/data/request_body/auth/local_login_request_body.dart';
import 'package:frontend_mobile/domain/model/auth/local_login_model.dart';
import 'package:frontend_mobile/domain/repository/auth_repository.dart';

final Provider<AuthRepository> authRepositoryProvider =
    Provider<AuthRepository>(
      (Ref ref) => AuthRepositoryImpl(api: ref.read(authApiProvider)),
    );

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.api});

  final AuthApi api;

  @override
  Future<LocalLoginModel> postDevLocalLogin({
    required LocalLoginRequestBody body,
  }) async {
    final LocalLoginEntity response = await api.postDevLocalLogin(body: body);

    return response.toModel();
  }
}
