import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend_mobile/common/env/env.dart';
import 'package:frontend_mobile/core/resource/constant.dart';
import 'package:frontend_mobile/core/resource/secure_storage/secure_storage.dart';
import 'package:frontend_mobile/core/resource/token_info.dart';
import 'package:frontend_mobile/domain/param/auth/refresh_token_params.dart';
import 'package:frontend_mobile/presentation/auth/auth_view_model.dart';
import 'package:frontend_mobile/presentation/global/login/login_view_model.dart';
import 'package:frontend_mobile/presentation/router/router.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final Provider<Dio> appDioProvider = Provider<Dio>((Ref ref) {
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    bool tokenRequired = true;

    if (AppRouter.rootNavigatorKey.currentContext != null) {
      final BuildContext context = AppRouter.rootNavigatorKey.currentContext!;
      final GoRouterState route = GoRouter.of(context).routerDelegate.state;

      final LoginState loginState = ref.read(loginViewModelProvider);

      if (route.name != null) {
        /// 회원가입 페이지인 경우
        if (route.name!.contains(AppRoutes.signUp.name)) {
          tokenRequired = false;
        }

        /// 로그인 페이지 && 로그인하지 않은 경우
        if (route.name!.contains(AppRoutes.localLogin.name) &&
            !loginState.isLoggedIn) {
          tokenRequired = false;
        }

        /// 비밀번호 찾기 페이지
        if (route.name!.contains(AppRoutes.findPassword.name)) {
          tokenRequired = false;
        }
      }
    }

    if (tokenRequired) {
      final FlutterSecureStorage storage = ref.read(secureStorageProvider);
      final String? json = await storage.read(key: Constant.tokenInfo);

      /// 토큰 정보가 있는 경우
      if (json != null) {
        final TokenInfo tokenInfo = TokenInfo.deserialize(json: json);

        final DateTime now = DateTime.now();
        final DateTime startTime = tokenInfo.startTime;
        final String accessToken = tokenInfo.accessToken;
        final int expiresIn = tokenInfo.expiresIn;
        final String refreshToken = tokenInfo.refreshToken;
        final int refreshExpiresIn = tokenInfo.refreshExpiresIn;
        final String deviceId = tokenInfo.deviceId;

        /// accessToken 유효, refreshToken 유효
        if (now.difference(startTime).inMilliseconds < expiresIn) {
          options.headers['Authorization'] = 'Bearer $accessToken';
        }
        /// accessToken 만료, refreshToken 유효
        else if (now.difference(startTime).inMilliseconds < refreshExpiresIn) {
          final String newAccessToken = await ref
              .read(authViewModelProvider.notifier)
              .postRefreshToken(
                params: RefreshTokenParams(
                  deviceId: deviceId,
                  refreshToken: refreshToken,
                ),
              );

          if (accessToken.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $newAccessToken';
          }
        }
        /// accessToken 만료, refreshToken 만료
        else {
          handler.reject(
            DioException(
              requestOptions: options,
              response: Response<dynamic>(
                statusCode: 403,
                requestOptions: RequestOptions(),
              ),
            ),
          );

          return;
        }
      }
      /// 토큰 정보가 없는 경우
      else {
        if (AppRouter.rootNavigatorKey.currentContext != null) {
          final BuildContext context =
              AppRouter.rootNavigatorKey.currentContext!;

          Future<void>.delayed(const Duration(milliseconds: 300), () {
            if (context.mounted) {
              context.goNamed(AppRoutes.localLogin.name);
            }
          });
        }

        return;
      }
    }

    options.headers['Platform-Type'] = 'app';
    handler.next(options);
  }

  return AppDio().dio
    ..interceptors.addAll(<Interceptor>[
      InterceptorsWrapper(onRequest: onRequest),
      if (kDebugMode) PrettyDioLogger(requestHeader: true, requestBody: true),
    ]);
});

/// 앱에서 사용할 Custom Dio
class AppDio {
  AppDio() {
    _dio =
        Dio()
          ..options = BaseOptions(
            baseUrl: Env.devServerBaseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            sendTimeout: const Duration(seconds: 10),
            contentType: Headers.jsonContentType,
          );
  }

  late final Dio _dio;

  Dio get dio => _dio;
}
