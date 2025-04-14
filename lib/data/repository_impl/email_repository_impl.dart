import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/api_call.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/data/data_source/remote/email_remote_data_source.dart';
import 'package:frontend_mobile/data/entity/email/email_verification_request_entity.dart';
import 'package:frontend_mobile/data/entity/email/email_verify_entity.dart';
import 'package:frontend_mobile/data/mapper/email_mapper.dart';
import 'package:frontend_mobile/domain/model/email/email_verification_request_model.dart';
import 'package:frontend_mobile/domain/model/email/email_verify_model.dart';
import 'package:frontend_mobile/domain/param/email/email_verification_request_params.dart';
import 'package:frontend_mobile/domain/param/email/email_verify_params.dart';
import 'package:frontend_mobile/domain/repository/email_repository.dart';

final Provider<EmailRepository> emailRepositoryProvider =
    Provider<EmailRepository>(
      (Ref ref) => EmailRepositoryImpl(api: ref.read(emailApiProvider)),
    );

class EmailRepositoryImpl implements EmailRepository {
  EmailRepositoryImpl({required this.api});

  final EmailRemoteDataSource api;

  @override
  Future<Result<EmailVerificationRequestModel, CustomException>>
  postVerificationRequest({
    required EmailVerificationRequestParams params,
  }) async {
    return await apiCall(
      api: () async {
        final EmailVerificationRequestEntity result = await api
            .postVerificationRequest(body: params.toBody());

        return result.toModel();
      },
    );
  }

  @override
  Future<Result<EmailVerifyModel, CustomException>> postVerify({
    required EmailVerifyParams params,
  }) async {
    return await apiCall(
      api: () async {
        final EmailVerifyEntity result = await api.postVerify(
          body: params.toBody(),
        );

        return result.toModel();
      },
    );
  }
}
