import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/store_repository_impl.dart';
import 'package:frontend_mobile/domain/model/store/store_summary_model.dart';
import 'package:frontend_mobile/domain/param/store/get_store_summary_params.dart';
import 'package:frontend_mobile/domain/repository/store_repository.dart';

final Provider<GetStoreSummaryUsecase> getStoreSummaryUsecaseProvider =
    Provider<GetStoreSummaryUsecase>((Ref ref) {
      return GetStoreSummaryUsecase(
        repository: ref.read(storeRepositoryProvider),
      );
    });

class GetStoreSummaryUsecase
    implements Usecase<StoreSummaryModel, GetStoreSummaryParams> {
  const GetStoreSummaryUsecase({required StoreRepository repository})
    : _repository = repository;
  final StoreRepository _repository;

  @override
  Future<Result<StoreSummaryModel, CustomException>> call({
    required GetStoreSummaryParams params,
  }) async {
    return await _repository.getStoreSummary(params: params);
  }
}
