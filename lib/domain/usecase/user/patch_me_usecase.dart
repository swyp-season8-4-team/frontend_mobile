import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/user_repository_impl.dart';
import 'package:frontend_mobile/domain/model/user/user_detail_model.dart';
import 'package:frontend_mobile/domain/param/user/patch_me_params.dart';
import 'package:frontend_mobile/domain/repository/user_repository.dart';

final Provider<PatchMeUsecase> patchMeUsecaseProvider =
    Provider<PatchMeUsecase>(
      (Ref ref) => PatchMeUsecase(repository: ref.read(userRepositoryProvider)),
    );

class PatchMeUsecase extends Usecase<UserDetailModel, PatchMeParams> {
  PatchMeUsecase({required this.repository});

  final UserRepository repository;

  @override
  Future<Result<UserDetailModel, CustomException>> call({
    required PatchMeParams params,
  }) async {
    return await repository.patchMe(params: params);
  }
}
