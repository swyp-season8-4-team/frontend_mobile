import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/auth_repository_impl.dart';
import 'package:frontend_mobile/domain/model/auth/local_login_model.dart';
import 'package:frontend_mobile/domain/param/auth/post_sign_up_params.dart';
import 'package:frontend_mobile/domain/repository/auth_repository.dart';

final Provider<PostSignUpUsecase> postSignUpUsecaseProvider = Provider<
  PostSignUpUsecase
>((Ref ref) => PostSignUpUsecase(repository: ref.read(authRepositoryProvider)));

class PostSignUpUsecase extends Usecase<LocalLoginModel, PostSignUpParams> {
  PostSignUpUsecase({required this.repository});

  final AuthRepository repository;

  @override
  Future<Result<LocalLoginModel, CustomException>> call({
    required PostSignUpParams params,
  }) async {
    return await repository.postSignUp(params: params);
  }
}
