import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/api_call.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/data/data_source/remote/auth_remote_data_source.dart';
import 'package:frontend_mobile/data/entity/auth/local_login_entity.dart';
import 'package:frontend_mobile/data/entity/auth/password_reset_entity.dart';
import 'package:frontend_mobile/data/entity/auth/sign_up_with_profile_entity.dart';
import 'package:frontend_mobile/data/mapper/auth_mapper.dart';
import 'package:frontend_mobile/data/request_header/auth/password_reset_header.dart';
import 'package:frontend_mobile/data/request_header/auth/post_sign_up_with_profile_header.dart';
import 'package:frontend_mobile/domain/model/auth/local_login_model.dart';
import 'package:frontend_mobile/domain/model/auth/password_reset_model.dart';
import 'package:frontend_mobile/domain/model/auth/sign_up_with_profile_model.dart';
import 'package:frontend_mobile/domain/param/auth/local_login_params.dart';
import 'package:frontend_mobile/domain/param/auth/password_reset_params.dart';
import 'package:frontend_mobile/domain/param/auth/post_sign_up_with_profile_params.dart';
import 'package:frontend_mobile/domain/repository/auth_repository.dart';

final Provider<AuthRepository> authRepositoryProvider =
    Provider<AuthRepository>(
      (Ref ref) => AuthRepositoryImpl(api: ref.read(authApiProvider)),
    );

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.api});

  final AuthRemoteDataSource api;

  @override
  Future<Result<SignUpWithProfileModel, CustomException>>
  postSignUpWithProfile({required PostSignUpWithProfileParams params}) async {
    return await apiCall(
      api: () async {
        final PostSignUpWithProfileHeader header = params.toHeader();

        final SignUpWithProfileEntity result = await api.postSignUp(
          emailToken: header.emailToken,
          formData: params.toBody().toFormData(),
        );
        return result.toModel();
      },
    );
  }

  @override
  Future<Result<PasswordResetModel, CustomException>> postPasswordReset({
    required PasswordResetParams params,
  }) async {
    return await apiCall(
      api: () async {
        final PasswordResetHeader header = params.toHeader();

        final PasswordResetEntity result = await api.postPasswordReset(
          emailToken: header.emailToken,
          body: params.toBody(),
        );
        return result.toModel();
      },
    );
  }

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
