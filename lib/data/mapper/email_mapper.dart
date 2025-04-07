import 'package:frontend_mobile/data/entity/email/email_verification_request_entity.dart';
import 'package:frontend_mobile/data/entity/email/email_verify_entity.dart';
import 'package:frontend_mobile/data/request_body/email/email_verification_request_request_body.dart';
import 'package:frontend_mobile/data/request_body/email/email_verify_request_body.dart';
import 'package:frontend_mobile/domain/model/email/email_verification_request_model.dart';
import 'package:frontend_mobile/domain/model/email/email_verify_model.dart';
import 'package:frontend_mobile/domain/param/email/email_verification_request_params.dart';
import 'package:frontend_mobile/domain/param/email/email_verify_params.dart';

extension EmailVerificationRequestEntityExt on EmailVerificationRequestEntity {
  EmailVerificationRequestModel toModel() {
    return EmailVerificationRequestModel(
      message: message,
      expirationMinutes: expirationMinutes,
    );
  }
}

extension EmailVerificationRequestParamsExt on EmailVerificationRequestParams {
  EmailVerificationRequestRequestBody toBody() {
    return EmailVerificationRequestRequestBody(email: email, purpose: purpose);
  }
}

extension EmailVerifiyEntityExt on EmailVerifyEntity {
  EmailVerifyModel toModel() {
    return EmailVerifyModel(
      verificationToken: verificationToken,
      verified: verified,
    );
  }
}

extension EmailVerifyParamsExt on EmailVerifyParams {
  EmailVerifyRequestBody toBody() {
    return EmailVerifyRequestBody(email: email, code: code, purpose: purpose);
  }
}
