import 'package:dio/dio.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:intl/intl.dart';

/// api 통신을 담당하는 함수 <br />
/// 성공하면 성공값을 반환하고, 실패하면 에러 경우에 따라 다르게 처리
Future<Result<T, CustomException>> apiCall<T>({
  required Future<T> Function() api,
}) async {
  const String errorPrefix = '[ERR]';
  final DateFormat formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSSSSSSS");
  final String timestamp = formatter.format(DateTime.now());

  try {
    final T response = await api();
    return Success<T, CustomException>(data: response);
  }
  /// dio 에러
  on DioException catch (exception) {
    if (exception.response == null) {
      return Failure<T, CustomException>(
        exception: CustomException.serverError(
          model: ExceptionModel(
            status: 600,
            code: 'ZZ000',
            message: '$errorPrefix 서버로부터 응답이 없습니다.',
            timestamp: timestamp,
          ),
        ),
      );
    }

    final ExceptionModel exceptionModel = ExceptionModel.fromJson(
      exception.response!.data,
    );

    switch (exceptionModel.code) {
      case 'C001':
        return Failure<T, CustomException>(
          exception: CustomException.invalidInputValue(model: exceptionModel),
        );
      case 'C002':
        return Failure<T, CustomException>(
          exception: CustomException.internalServerError(model: exceptionModel),
        );
      case 'A001':
        return Failure<T, CustomException>(
          exception: CustomException.duplicateEmail(model: exceptionModel),
        );
      case 'A002':
        return Failure<T, CustomException>(
          exception: CustomException.duplicateNickname(model: exceptionModel),
        );
      case 'A003':
        return Failure<T, CustomException>(
          exception: CustomException.invalidVerificationToken(
            model: exceptionModel,
          ),
        );
      case 'A004':
        return Failure<T, CustomException>(
          exception: CustomException.expiredVerificationToken(
            model: exceptionModel,
          ),
        );
      case 'A005':
        return Failure<T, CustomException>(
          exception: CustomException.passwordMismatch(model: exceptionModel),
        );
      case 'A006':
        return Failure<T, CustomException>(
          exception: CustomException.invalidCredentials(model: exceptionModel),
        );
      case 'A007':
        return Failure<T, CustomException>(
          exception: CustomException.signupRestrictedDeletedAccount(
            model: exceptionModel,
          ),
        );
      case 'E005':
        return Failure<T, CustomException>(
          exception: CustomException.emailSendingFailed(model: exceptionModel),
        );
      case 'E001':
        return Failure<T, CustomException>(
          exception: CustomException.tooManyVerificationRequests(
            model: exceptionModel,
          ),
        );
      case 'E006':
        return Failure<T, CustomException>(
          exception: CustomException.emailAlreadyRegistered(
            model: exceptionModel,
          ),
        );
      case 'U001':
        return Failure<T, CustomException>(
          exception: CustomException.userNotFound(model: exceptionModel),
        );
      case 'U002':
        return Failure<T, CustomException>(
          exception: CustomException.userDeleted(model: exceptionModel),
        );
      case 'U003':
        return Failure<T, CustomException>(
          exception: CustomException.invalidUserStatus(model: exceptionModel),
        );
      case 'U004':
        return Failure<T, CustomException>(
          exception: CustomException.unauthorizedAccess(model: exceptionModel),
        );
      case 'U005':
        return Failure<T, CustomException>(
          exception: CustomException.invalidUserUuid(model: exceptionModel),
        );
      case 'P001':
        return Failure<T, CustomException>(
          exception: CustomException.preferencesNotFound(model: exceptionModel),
        );
      case 'P002':
        return Failure<T, CustomException>(
          exception: CustomException.userPreferencesNotFound(
            model: exceptionModel,
          ),
        );
      case 'S001':
        return Failure<T, CustomException>(
          exception: CustomException.storeNotFound(model: exceptionModel),
        );
      case 'S002':
        return Failure<T, CustomException>(
          exception: CustomException.storeCreationFailed(model: exceptionModel),
        );
      case 'S003':
        return Failure<T, CustomException>(
          exception: CustomException.storeAccessDenied(model: exceptionModel),
        );
      case 'S004':
        return Failure<T, CustomException>(
          exception: CustomException.storeAlreadyExists(model: exceptionModel),
        );
      case 'S005':
        return Failure<T, CustomException>(
          exception: CustomException.storeListNotFound(model: exceptionModel),
        );
      case 'S006':
        return Failure<T, CustomException>(
          exception: CustomException.storeDuplicateList(model: exceptionModel),
        );
      case 'S007':
        return Failure<T, CustomException>(
          exception: CustomException.storeDuplicateListName(
            model: exceptionModel,
          ),
        );
      case 'S008':
        return Failure<T, CustomException>(
          exception: CustomException.storeDuplicateColor(model: exceptionModel),
        );
      case 'S009':
        return Failure<T, CustomException>(
          exception: CustomException.storeAlreadySaved(model: exceptionModel),
        );
      case 'S010':
        return Failure<T, CustomException>(
          exception: CustomException.savedStoreNotFound(model: exceptionModel),
        );
      case 'S011':
        return Failure<T, CustomException>(
          exception: CustomException.invalidStoreUuid(model: exceptionModel),
        );
      case 'S012':
        return Failure<T, CustomException>(
          exception: CustomException.invalidTagSelection(model: exceptionModel),
        );
      case 'S013':
        return Failure<T, CustomException>(
          exception: CustomException.invalidTagIncluded(model: exceptionModel),
        );
      case 'S014':
        return Failure<T, CustomException>(
          exception: CustomException.invalidStoreReviewUuid(
            model: exceptionModel,
          ),
        );
      case 'S015':
        return Failure<T, CustomException>(
          exception: CustomException.storeReviewNotFound(model: exceptionModel),
        );
      case 'S016':
        return Failure<T, CustomException>(
          exception: CustomException.invalidStoreReview(model: exceptionModel),
        );
      case 'S017':
        return Failure<T, CustomException>(
          exception: CustomException.invalidStoreMenuUuid(
            model: exceptionModel,
          ),
        );
      case 'S018':
        return Failure<T, CustomException>(
          exception: CustomException.storeMenuNotFound(model: exceptionModel),
        );
      case 'S019':
        return Failure<T, CustomException>(
          exception: CustomException.invalidStoreMenu(model: exceptionModel),
        );
      default:
        return Failure<T, CustomException>(
          exception: CustomException.networkError(
            model: ExceptionModel(
              status: 601,
              code: 'ZZ001',
              message: '$errorPrefix 통신 에러입니다.',
              timestamp: timestamp,
            ),
          ),
        );
    }
  }
  /// dio 에러를 제외한 모든 에러
  catch (exception) {
    return Failure<T, CustomException>(
      exception: CustomException.unknownError(
        model: ExceptionModel(
          status: 602,
          code: 'ZZ002',
          message: '$errorPrefix 알 수 없는 에러입니다.',
          timestamp: timestamp,
        ),
      ),
    );
  }
}
