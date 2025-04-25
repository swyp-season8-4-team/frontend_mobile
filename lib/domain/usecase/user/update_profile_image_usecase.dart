import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/user_repository_impl.dart';
import 'package:frontend_mobile/domain/param/user/update_profile_image_params.dart';
import 'package:frontend_mobile/domain/repository/user_repository.dart';

final Provider<UpdateProfileImageUsecase> updateProfileImageUsecaseProvider =
    Provider<UpdateProfileImageUsecase>((Ref ref) {
      return UpdateProfileImageUsecase(
        repository: ref.read(userRepositoryProvider),
      );
    });

class UpdateProfileImageUsecase
    implements Usecase<void, UpdateProfileImageParams> {
  const UpdateProfileImageUsecase({required UserRepository repository})
    : _repository = repository;
  final UserRepository _repository;

  @override
  Future<Result<void, CustomException>> call({
    required UpdateProfileImageParams params,
  }) async {
    return await _repository.updateProfileImage(params: params);
  }
}
