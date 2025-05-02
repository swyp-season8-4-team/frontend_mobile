import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/auth_repository_impl.dart';
import 'package:frontend_mobile/domain/model/auth/sign_up_with_profile_model.dart';
import 'package:frontend_mobile/domain/param/auth/post_sign_up_with_profile_params.dart';
import 'package:frontend_mobile/domain/repository/auth_repository.dart';

final Provider<PostSignUpWithProfileUsecase> postSignUpUsecaseProvider =
    Provider<PostSignUpWithProfileUsecase>(
      (Ref ref) => PostSignUpWithProfileUsecase(
        repository: ref.read(authRepositoryProvider),
      ),
    );

class PostSignUpWithProfileUsecase
    extends Usecase<SignUpWithProfileModel, PostSignUpWithProfileParams> {
  PostSignUpWithProfileUsecase({required this.repository});

  final AuthRepository repository;

  @override
  Future<Result<SignUpWithProfileModel, CustomException>> call({
    required PostSignUpWithProfileParams params,
  }) async {
    return await repository.postSignUpWithProfile(params: params);
  }
}
