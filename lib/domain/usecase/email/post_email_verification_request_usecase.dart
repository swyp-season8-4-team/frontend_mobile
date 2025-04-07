import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/email_repository_impl.dart';
import 'package:frontend_mobile/domain/model/email/email_verification_request_model.dart';
import 'package:frontend_mobile/domain/param/email/email_verification_request_params.dart';
import 'package:frontend_mobile/domain/repository/email_repository.dart';

final Provider<PostEmailVerificationRequestUsecase>
postVerificationRequestUsecaseProvider =
    Provider<PostEmailVerificationRequestUsecase>(
      (Ref ref) => PostEmailVerificationRequestUsecase(
        repository: ref.read(emailRepositoryProvider),
      ),
    );

class PostEmailVerificationRequestUsecase
    extends
        Usecase<EmailVerificationRequestModel, EmailVerificationRequestParams> {
  /// 이메일 인증 코드 발송
  PostEmailVerificationRequestUsecase({required this.repository});

  final EmailRepository repository;

  @override
  Future<Result<EmailVerificationRequestModel, CustomException>> call({
    required EmailVerificationRequestParams params,
  }) async {
    return await repository.postVerificationRequest(params: params);
  }
}
