import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';

/// T: 모델, P: 매개변수
abstract class Usecase<T, P> {
  Future<Result<T, CustomException>> call({required P params});

  /// R1: 모델, R2: 매개변수
  static Future<Result<T, CustomException>> execute<T, P>({
    required Usecase<T, P> usecase,
    required P params,
  }) async {
    return await usecase(params: params);
  }
}
