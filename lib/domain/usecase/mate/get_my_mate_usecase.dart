import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/mate_repository_impl.dart';
import 'package:frontend_mobile/domain/model/mate/mate_model.dart';
import 'package:frontend_mobile/domain/param/mate/get_my_mate_params.dart';
import 'package:frontend_mobile/domain/repository/mate_repository.dart';

final Provider<GetMyMateUsecase> getMyMateUsecaseProvider =
    Provider<GetMyMateUsecase>((Ref ref) {
      return GetMyMateUsecase(repository: ref.read(mateRepositoryProvider));
    });

class GetMyMateUsecase implements Usecase<MateModel, GetMyMateParams> {
  const GetMyMateUsecase({required MateRepository repository})
    : _repository = repository;
  final MateRepository _repository;

  @override
  Future<Result<MateModel, CustomException>> call({
    required GetMyMateParams params,
  }) async {
    return await _repository.getMyMates(params: params);
  }
}
