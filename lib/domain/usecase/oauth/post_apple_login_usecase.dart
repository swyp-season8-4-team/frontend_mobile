import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/oatuh_repository_impl.dart';
import 'package:frontend_mobile/domain/model/oauth/apple_model.dart';
import 'package:frontend_mobile/domain/param/oauth/apple_params.dart';
import 'package:frontend_mobile/domain/repository/oauth_repository.dart';

final Provider<PostAppleLoginUsecase> postAppleLoginUsecaseProvider =
    Provider<PostAppleLoginUsecase>(
      (Ref ref) =>
          PostAppleLoginUsecase(repository: ref.read(oauthRepositoryProvider)),
    );

class PostAppleLoginUsecase extends Usecase<AppleModel, AppleParams> {
  /// Apple 회원가입, 로그인
  PostAppleLoginUsecase({required this.repository});

  final OauthRepository repository;

  @override
  Future<Result<AppleModel, CustomException>> call({
    required AppleParams params,
  }) async {
    return await repository.appleLogin(params: params);
  }
}
