import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend_mobile/common/env/env.dart';
import 'package:frontend_mobile/core/resource/constant.dart';
import 'package:frontend_mobile/core/resource/secure_storage/secure_storage.dart';
import 'package:frontend_mobile/core/resource/token_info.dart';
import 'package:frontend_mobile/presentation/router/router.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final Provider<Dio> appDioProvider = Provider<Dio>((Ref ref) {
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    /// TODO: 토큰이 만료되면, refreshToken로 새로운 토큰 받아오고,
    /// refreshToken 만료되면 로그인 창으로 이동시켜야 함

    bool tokenRequired = true;

    if (AppRouter.rootNavigatorKey.currentContext != null) {
      final BuildContext context = AppRouter.rootNavigatorKey.currentContext!;
      final GoRouterState route = GoRouter.of(context).routerDelegate.state;

      if (route.name != null) {
        /// 회원가입
        if (route.name!.contains(AppRoutes.signUp.name)) {
          tokenRequired = false;
        }

        /// 로그인
        // if (route.name!.contains(AppRoutes.localLogin.name)) {
        //   tokenRequired = false;
        // }
      }
    }

    if (tokenRequired) {
      final FlutterSecureStorage storage = ref.read(secureStorageProvider);

      final String? json = await storage.read(key: Constant.tokenInfo);

      if (json != null) {
        final TokenInfo tokenInfo = TokenInfo.deserialize(json: json);
        final String accessToken = tokenInfo.accessToken;

        options.headers['Authorization'] = 'Bearer $accessToken';
      }
    }

    options.headers['Platform-Type'] = 'app';

    handler.next(options);
  }

  return _AppDio().dio
    ..interceptors.addAll(<Interceptor>[
      InterceptorsWrapper(onRequest: onRequest),
      if (kDebugMode) PrettyDioLogger(requestHeader: true, requestBody: true),
    ]);
});

/// 앱에서 사용할 Custom Dio
class _AppDio {
  _AppDio() {
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
