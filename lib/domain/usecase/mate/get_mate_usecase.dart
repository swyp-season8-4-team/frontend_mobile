import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/mate_repository_impl.dart';
import 'package:frontend_mobile/domain/model/mate/mate_model.dart';
import 'package:frontend_mobile/domain/param/mate/get_mate_params.dart';
import 'package:frontend_mobile/domain/repository/mate_repository.dart';

final Provider<GetMateUsecase> getMateUsecaseProvider =
    Provider<GetMateUsecase>(
      (Ref ref) => GetMateUsecase(repository: ref.read(mateRepositoryProvider)),
    );

class GetMateUsecase extends Usecase<MateModel, GetMateParams> {
  GetMateUsecase({required this.repository});

  final MateRepository repository;

  @override
  Future<Result<MateModel, CustomException>> call({
    required GetMateParams params,
  }) async {
    return await repository.getMate(params: params);
  }
}
