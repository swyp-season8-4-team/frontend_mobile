import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/domain/model/email/email_verification_request_model.dart';
import 'package:frontend_mobile/domain/model/email/email_verify_model.dart';
import 'package:frontend_mobile/domain/param/email/email_verification_request_params.dart';
import 'package:frontend_mobile/domain/param/email/email_verify_params.dart';

abstract interface class EmailRepository {
  /// 이메일 인증 코드 발송(domain)
  Future<Result<EmailVerificationRequestModel, CustomException>>
  postVerificationRequest({required EmailVerificationRequestParams params});

  /// 이메일 인증 코드 확인(domain)
  Future<Result<EmailVerifyModel, CustomException>> postVerify({
    required EmailVerifyParams params,
  });
}
