import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/auth_repository_impl.dart';
import 'package:frontend_mobile/domain/model/auth/refresh_token_model.dart';
import 'package:frontend_mobile/domain/param/auth/refresh_token_params.dart';
import 'package:frontend_mobile/domain/repository/auth_repository.dart';

final Provider<PostRefreshTokenUsecase> postRefreshTokenUsecaseProvider =
    Provider<PostRefreshTokenUsecase>(
      (Ref ref) =>
          PostRefreshTokenUsecase(repository: ref.read(authRepositoryProvider)),
    );

class PostRefreshTokenUsecase
    extends Usecase<RefreshTokenModel, RefreshTokenParams> {
  PostRefreshTokenUsecase({required this.repository});

  final AuthRepository repository;

  @override
  Future<Result<RefreshTokenModel, CustomException>> call({
    required RefreshTokenParams params,
  }) async {
    return await repository.postRefreshToken(params: params);
  }
}
