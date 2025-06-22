import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/oatuh_repository_impl.dart';
import 'package:frontend_mobile/domain/model/oauth/kakao_model.dart';
import 'package:frontend_mobile/domain/param/oauth/kakao_params.dart';
import 'package:frontend_mobile/domain/repository/oauth_repository.dart';

final Provider<PostKakaoLoginUsecase> postKakaoLoginUsecaseProvider =
    Provider<PostKakaoLoginUsecase>(
      (Ref ref) =>
          PostKakaoLoginUsecase(repository: ref.read(oauthRepositoryProvider)),
    );

class PostKakaoLoginUsecase extends Usecase<KakaoModel, KakaoParams> {
  /// OAuth 회원가입, 로그인
  PostKakaoLoginUsecase({required this.repository});

  final OauthRepository repository;

  @override
  Future<Result<KakaoModel, CustomException>> call({
    required KakaoParams params,
  }) async {
    return await repository.kakaoLogin(params: params);
  }
}
