import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/auth_repository_impl.dart';
import 'package:frontend_mobile/domain/model/auth/password_reset_model.dart';
import 'package:frontend_mobile/domain/param/auth/password_reset_params.dart';
import 'package:frontend_mobile/domain/repository/auth_repository.dart';

final Provider<PostPasswordResetUsecase> postPasswordResetUsecaseProvider =
    Provider<PostPasswordResetUsecase>(
      (Ref ref) => PostPasswordResetUsecase(
        repository: ref.read(authRepositoryProvider),
      ),
    );

class PostPasswordResetUsecase
    extends Usecase<PasswordResetModel, PasswordResetParams> {
  PostPasswordResetUsecase({required this.repository});

  final AuthRepository repository;

  @override
  Future<Result<PasswordResetModel, CustomException>> call({
    required PasswordResetParams params,
  }) async {
    return await repository.postPasswordReset(params: params);
  }
}
