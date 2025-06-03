import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/constant.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/secure_storage/secure_storage.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/token_info.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/auth/refresh_token_model.dart';
import 'package:frontend_mobile/domain/param/auth/refresh_token_params.dart';
import 'package:frontend_mobile/domain/usecase/auth/post_refresh_token_usecase.dart';

part 'auth_state.dart';
part 'generated/auth_view_model.freezed.dart';

final AutoDisposeStateNotifierProvider<AuthViewModel, AuthState>
authViewModelProvider =
    StateNotifierProvider.autoDispose<AuthViewModel, AuthState>(
      (Ref ref) => AuthViewModel(ref: ref),
    );

class AuthViewModel extends StateNotifier<AuthState> {
  AuthViewModel({required this.ref}) : super(const AuthState());

  final Ref ref;

  /// 토큰 재발급
  Future<String> postRefreshToken({required RefreshTokenParams params}) async {
    state = state.copyWith(statusRefreshToken: Status.loading);

    final Result<RefreshTokenModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(postRefreshTokenUsecaseProvider),
          params: params,
        );

    String accessToken = '';
    await response.map(
      success: (Success<RefreshTokenModel, CustomException> success) async {
        final FlutterSecureStorage storage = ref.read(secureStorageProvider);
        final String? json = await storage.read(key: Constant.tokenInfo);

        if (json != null) {
          final TokenInfo tokenInfo = TokenInfo.deserialize(json: json);

          final String refreshToken = tokenInfo.refreshToken;
          final int refreshExpiresIn = tokenInfo.refreshExpiresIn;

          final TokenInfo newTokenInfo = TokenInfo(
            startTime: DateTime.now(),
            accessToken: success.data.accessToken,
            refreshToken: refreshToken,
            refreshExpiresIn: refreshExpiresIn,
            expiresIn: success.data.expiresIn,
            deviceId: success.data.deviceId ?? '',
          );

          await storage.write(
            key: Constant.tokenInfo,
            value: TokenInfo.serialize(tokenInfo: newTokenInfo),
          );
        }

        accessToken = success.data.accessToken;
      },
      failure: (Failure<RefreshTokenModel, CustomException> failure) {
        state = state.copyWith(
          statusRefreshToken: Status.failure,
          exception: failure.exception.model,
        );
      },
    );

    return accessToken;
  }
}
