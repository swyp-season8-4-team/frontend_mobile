import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/env/env.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final Provider<Dio> appDioProvider = Provider<Dio>((Ref ref) {
  return _AppDio().dio
    ..interceptors.addAll(<Interceptor>[
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
