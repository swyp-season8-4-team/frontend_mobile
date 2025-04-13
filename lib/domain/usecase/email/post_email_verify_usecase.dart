import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/email_repository_impl.dart';
import 'package:frontend_mobile/domain/model/email/email_verify_model.dart';
import 'package:frontend_mobile/domain/param/email/email_verify_params.dart';
import 'package:frontend_mobile/domain/repository/email_repository.dart';

final Provider<PostEmailVerifyUsecase> postVerifyUsecaseProvider =
    Provider<PostEmailVerifyUsecase>(
      (Ref ref) =>
          PostEmailVerifyUsecase(repository: ref.read(emailRepositoryProvider)),
    );

class PostEmailVerifyUsecase
    extends Usecase<EmailVerifyModel, EmailVerifyParams> {
  /// 이메일 인증 코드 확인
  PostEmailVerifyUsecase({required this.repository});

  final EmailRepository repository;

  @override
  Future<Result<EmailVerifyModel, CustomException>> call({
    required EmailVerifyParams params,
  }) async {
    return await repository.postVerify(params: params);
  }
}
