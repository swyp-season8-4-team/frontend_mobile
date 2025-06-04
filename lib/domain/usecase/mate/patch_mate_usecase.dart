import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/mate_repository_impl.dart';
import 'package:frontend_mobile/domain/model/mate/mate_patch_model.dart';
import 'package:frontend_mobile/domain/param/mate/patch_mate_params.dart';
import 'package:frontend_mobile/domain/repository/mate_repository.dart';

final Provider<PatchMateUsecase> patchMateUsecaseProvider = Provider<
  PatchMateUsecase
>((Ref ref) => PatchMateUsecase(repository: ref.read(mateRepositoryProvider)));

class PatchMateUsecase extends Usecase<MatePatchModel, PatchMateParams> {
  PatchMateUsecase({required this.repository});

  final MateRepository repository;

  @override
  Future<Result<MatePatchModel, CustomException>> call({
    required PatchMateParams params,
  }) async {
    return await repository.patchMate(params: params);
  }
}
