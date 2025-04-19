import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/store_repository_impl.dart';
import 'package:frontend_mobile/domain/model/store/store_detail_model.dart';
import 'package:frontend_mobile/domain/param/store/get_store_detail_params.dart';
import 'package:frontend_mobile/domain/repository/store_repository.dart';

final Provider<GetStoreDetailUsecase> getStoreDetailUsecaseProvider =
    Provider<GetStoreDetailUsecase>((Ref ref) {
      return GetStoreDetailUsecase(
        repository: ref.read(storeRepositoryProvider),
      );
    });

class GetStoreDetailUsecase
    implements Usecase<StoreDetailModel, GetStoreDetailParams> {
  const GetStoreDetailUsecase({required StoreRepository repository})
    : _repository = repository;
  final StoreRepository _repository;

  @override
  Future<Result<StoreDetailModel, CustomException>> call({
    required GetStoreDetailParams params,
  }) async {
    return await _repository.getStoreDetail(params: params);
  }
}
