import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/mate_repository_impl.dart';
import 'package:frontend_mobile/domain/model/mate/mate_detail_model.dart';
import 'package:frontend_mobile/domain/param/mate/get_mate_detail_params.dart';
import 'package:frontend_mobile/domain/repository/mate_repository.dart';

final Provider<GetMateDetailUsecase> getMateDetailUsecaseProvider =
    Provider<GetMateDetailUsecase>(
      (Ref ref) =>
          GetMateDetailUsecase(repository: ref.read(mateRepositoryProvider)),
    );

class GetMateDetailUsecase
    extends Usecase<MateDetailModel, GetMateDetailParams> {
  GetMateDetailUsecase({required this.repository});

  final MateRepository repository;

  @override
  Future<Result<MateDetailModel, CustomException>> call({
    required GetMateDetailParams params,
  }) async {
    return await repository.getMateDetail(params: params);
  }
}
