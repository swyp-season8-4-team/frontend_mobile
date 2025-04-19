import 'dart:developer';

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
          exception: CustomException.c001(model: exceptionModel),
        );
      case 'C002':
        return Failure<T, CustomException>(
          exception: CustomException.c002(model: exceptionModel),
        );
      case 'A001':
        return Failure<T, CustomException>(
          exception: CustomException.a001(model: exceptionModel),
        );
      case 'A002':
        return Failure<T, CustomException>(
          exception: CustomException.a002(model: exceptionModel),
        );
      case 'A003':
        return Failure<T, CustomException>(
          exception: CustomException.a003(model: exceptionModel),
        );
      case 'A004':
        return Failure<T, CustomException>(
          exception: CustomException.a004(model: exceptionModel),
        );
      case 'A005':
        return Failure<T, CustomException>(
          exception: CustomException.a005(model: exceptionModel),
        );
      case 'A006':
        return Failure<T, CustomException>(
          exception: CustomException.a006(model: exceptionModel),
        );
      case 'A007':
        return Failure<T, CustomException>(
          exception: CustomException.a007(model: exceptionModel),
        );
      case 'A008':
        return Failure<T, CustomException>(
          exception: CustomException.a008(model: exceptionModel),
        );
      case 'A009':
        return Failure<T, CustomException>(
          exception: CustomException.a009(model: exceptionModel),
        );
      case 'A010':
        return Failure<T, CustomException>(
          exception: CustomException.a010(model: exceptionModel),
        );
      case 'A011':
        return Failure<T, CustomException>(
          exception: CustomException.a011(model: exceptionModel),
        );
      case 'A012':
        return Failure<T, CustomException>(
          exception: CustomException.a012(model: exceptionModel),
        );
      case 'A013':
        return Failure<T, CustomException>(
          exception: CustomException.a013(model: exceptionModel),
        );
      case 'A014':
        return Failure<T, CustomException>(
          exception: CustomException.a014(model: exceptionModel),
        );
      case 'O001':
        return Failure<T, CustomException>(
          exception: CustomException.o001(model: exceptionModel),
        );
      case 'J001':
        return Failure<T, CustomException>(
          exception: CustomException.j001(model: exceptionModel),
        );
      case 'J002':
        return Failure<T, CustomException>(
          exception: CustomException.j002(model: exceptionModel),
        );
      case 'J003':
        return Failure<T, CustomException>(
          exception: CustomException.j003(model: exceptionModel),
        );
      case 'J004':
        return Failure<T, CustomException>(
          exception: CustomException.j004(model: exceptionModel),
        );
      case 'J005':
        return Failure<T, CustomException>(
          exception: CustomException.j005(model: exceptionModel),
        );
      case 'E001':
        return Failure<T, CustomException>(
          exception: CustomException.e001(model: exceptionModel),
        );
      case 'E005':
        return Failure<T, CustomException>(
          exception: CustomException.e005(model: exceptionModel),
        );
      case 'U001':
        return Failure<T, CustomException>(
          exception: CustomException.u001(model: exceptionModel),
        );
      case 'U004':
        return Failure<T, CustomException>(
          exception: CustomException.u004(model: exceptionModel),
        );
      case 'U005':
        return Failure<T, CustomException>(
          exception: CustomException.u005(model: exceptionModel),
        );
      case 'P001':
        return Failure<T, CustomException>(
          exception: CustomException.p001(model: exceptionModel),
        );
      case 'P002':
        return Failure<T, CustomException>(
          exception: CustomException.p002(model: exceptionModel),
        );
      case 'K001':
        return Failure<T, CustomException>(
          exception: CustomException.k001(model: exceptionModel),
        );
      case 'K002':
        return Failure<T, CustomException>(
          exception: CustomException.k002(model: exceptionModel),
        );
      case 'S001':
        return Failure<T, CustomException>(
          exception: CustomException.s001(model: exceptionModel),
        );
      case 'S002':
        return Failure<T, CustomException>(
          exception: CustomException.s002(model: exceptionModel),
        );
      case 'S003':
        return Failure<T, CustomException>(
          exception: CustomException.s003(model: exceptionModel),
        );
      case 'S004':
        return Failure<T, CustomException>(
          exception: CustomException.s004(model: exceptionModel),
        );
      case 'S005':
        return Failure<T, CustomException>(
          exception: CustomException.s005(model: exceptionModel),
        );
      case 'S007':
        return Failure<T, CustomException>(
          exception: CustomException.s007(model: exceptionModel),
        );
      case 'S009':
        return Failure<T, CustomException>(
          exception: CustomException.s009(model: exceptionModel),
        );
      case 'S010':
        return Failure<T, CustomException>(
          exception: CustomException.s010(model: exceptionModel),
        );
      case 'S011':
        return Failure<T, CustomException>(
          exception: CustomException.s011(model: exceptionModel),
        );
      case 'S012':
        return Failure<T, CustomException>(
          exception: CustomException.s012(model: exceptionModel),
        );
      case 'S013':
        return Failure<T, CustomException>(
          exception: CustomException.s013(model: exceptionModel),
        );
      case 'S014':
        return Failure<T, CustomException>(
          exception: CustomException.s014(model: exceptionModel),
        );
      case 'S015':
        return Failure<T, CustomException>(
          exception: CustomException.s015(model: exceptionModel),
        );
      case 'S016':
        return Failure<T, CustomException>(
          exception: CustomException.s016(model: exceptionModel),
        );
      case 'S017':
        return Failure<T, CustomException>(
          exception: CustomException.s017(model: exceptionModel),
        );
      case 'S018':
        return Failure<T, CustomException>(
          exception: CustomException.s018(model: exceptionModel),
        );
      case 'S019':
        return Failure<T, CustomException>(
          exception: CustomException.s019(model: exceptionModel),
        );
      case 'F001':
        return Failure<T, CustomException>(
          exception: CustomException.f001(model: exceptionModel),
        );
      case 'F002':
        return Failure<T, CustomException>(
          exception: CustomException.f002(model: exceptionModel),
        );
      case 'F003':
        return Failure<T, CustomException>(
          exception: CustomException.f003(model: exceptionModel),
        );
      case 'F004':
        return Failure<T, CustomException>(
          exception: CustomException.f004(model: exceptionModel),
        );
      case 'F005':
        return Failure<T, CustomException>(
          exception: CustomException.f005(model: exceptionModel),
        );
      case 'I001':
        return Failure<T, CustomException>(
          exception: CustomException.i001(model: exceptionModel),
        );
      case 'I002':
        return Failure<T, CustomException>(
          exception: CustomException.i002(model: exceptionModel),
        );
      case 'I003':
        return Failure<T, CustomException>(
          exception: CustomException.i003(model: exceptionModel),
        );
      case 'M001':
        return Failure<T, CustomException>(
          exception: CustomException.m001(model: exceptionModel),
        );
      case 'M002':
        return Failure<T, CustomException>(
          exception: CustomException.m002(model: exceptionModel),
        );
      case 'M003':
        return Failure<T, CustomException>(
          exception: CustomException.m003(model: exceptionModel),
        );
      case 'M004':
        return Failure<T, CustomException>(
          exception: CustomException.m004(model: exceptionModel),
        );
      case 'M005':
        return Failure<T, CustomException>(
          exception: CustomException.m005(model: exceptionModel),
        );
      case 'M006':
        return Failure<T, CustomException>(
          exception: CustomException.m006(model: exceptionModel),
        );
      case 'M007':
        return Failure<T, CustomException>(
          exception: CustomException.m007(model: exceptionModel),
        );
      case 'M008':
        return Failure<T, CustomException>(
          exception: CustomException.m008(model: exceptionModel),
        );
      case 'M009':
        return Failure<T, CustomException>(
          exception: CustomException.m009(model: exceptionModel),
        );
      case 'M010':
        return Failure<T, CustomException>(
          exception: CustomException.m010(model: exceptionModel),
        );
      case 'M011':
        return Failure<T, CustomException>(
          exception: CustomException.m011(model: exceptionModel),
        );
      case 'M012':
        return Failure<T, CustomException>(
          exception: CustomException.m012(model: exceptionModel),
        );
      case 'M013':
        return Failure<T, CustomException>(
          exception: CustomException.m013(model: exceptionModel),
        );
      case 'M014':
        return Failure<T, CustomException>(
          exception: CustomException.m014(model: exceptionModel),
        );
      case 'M015':
        return Failure<T, CustomException>(
          exception: CustomException.m015(model: exceptionModel),
        );
      case 'M016':
        return Failure<T, CustomException>(
          exception: CustomException.m016(model: exceptionModel),
        );
      case 'M017':
        return Failure<T, CustomException>(
          exception: CustomException.m017(model: exceptionModel),
        );
      case 'R001':
        return Failure<T, CustomException>(
          exception: CustomException.r001(model: exceptionModel),
        );
      case 'R002':
        return Failure<T, CustomException>(
          exception: CustomException.r002(model: exceptionModel),
        );
      case 'R003':
        return Failure<T, CustomException>(
          exception: CustomException.r003(model: exceptionModel),
        );
      case 'R004':
        return Failure<T, CustomException>(
          exception: CustomException.r004(model: exceptionModel),
        );
      case 'R005':
        return Failure<T, CustomException>(
          exception: CustomException.r005(model: exceptionModel),
        );
      case 'R006':
        return Failure<T, CustomException>(
          exception: CustomException.r006(model: exceptionModel),
        );
      case 'R007':
        return Failure<T, CustomException>(
          exception: CustomException.r007(model: exceptionModel),
        );
      case 'R008':
        return Failure<T, CustomException>(
          exception: CustomException.r008(model: exceptionModel),
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
    log(exception.toString());
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
