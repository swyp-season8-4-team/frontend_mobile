import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';

/// Result 패턴 적용
abstract class Result<T, E extends CustomException> {
  const Result();

  R map<R>({
    required R Function(Success<T, E> success) success,
    required R Function(Failure<T, E> failure) failure,
  }) {
    if (this is Success) {
      return success(this as Success<T, E>);
    }

    return failure(this as Failure<T, E>);
  }
}

class Success<T, E extends CustomException> extends Result<T, E> {
  const Success({required this.data});
  final T data;
}

class Failure<T, E extends CustomException> extends Result<T, E> {
  const Failure({required this.exception});
  final E exception;
}
