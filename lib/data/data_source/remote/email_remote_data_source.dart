import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/network/app_dio.dart';
import 'package:frontend_mobile/data/entity/email/email_verification_request_entity.dart';
import 'package:frontend_mobile/data/entity/email/email_verify_entity.dart';
import 'package:frontend_mobile/data/request_body/email/email_verification_request_request_body.dart';
import 'package:frontend_mobile/data/request_body/email/email_verify_request_body.dart';
import 'package:retrofit/retrofit.dart';

part 'generated/email_remote_data_source.g.dart';

final Provider<EmailRemoteDataSource> emailApiProvider =
    Provider<EmailRemoteDataSource>((Ref ref) {
      final Dio dio = ref.read(appDioProvider);
      return EmailRemoteDataSource(dio);
    });

@RestApi()
abstract interface class EmailRemoteDataSource {
  factory EmailRemoteDataSource(Dio dio, {String? baseUrl}) =
      _EmailRemoteDataSource;

  /// 이메일 인증 코드 발송(data)
  @POST('/api/auth/email/verification-request')
  Future<EmailVerificationRequestEntity> postVerificationRequest({
    @Body() required EmailVerificationRequestRequestBody body,
  });

  /// 이메일 인증 코드 확인(data)
  @POST('/api/auth/email/verify')
  Future<EmailVerifyEntity> postVerify({
    @Body() required EmailVerifyRequestBody body,
  });
}
