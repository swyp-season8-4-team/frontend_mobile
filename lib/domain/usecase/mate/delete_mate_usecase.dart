import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/mate_repository_impl.dart';
import 'package:frontend_mobile/domain/model/mate/mate_delete_model.dart';
import 'package:frontend_mobile/domain/param/mate/delete_mate_params.dart';
import 'package:frontend_mobile/domain/repository/mate_repository.dart';

final Provider<DeleteMateUsecase> deleteMateUsecaseProvider = Provider<
  DeleteMateUsecase
>((Ref ref) => DeleteMateUsecase(repository: ref.read(mateRepositoryProvider)));

class DeleteMateUsecase extends Usecase<MateDeleteModel, DeleteMateParams> {
  DeleteMateUsecase({required this.repository});

  final MateRepository repository;

  @override
  Future<Result<MateDeleteModel, CustomException>> call({
    required DeleteMateParams params,
  }) async {
    return await repository.deleteMate(params: params);
  }
}
