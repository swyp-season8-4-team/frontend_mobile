import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/store_repository_impl.dart';
import 'package:frontend_mobile/domain/model/store/store_by_location_model.dart';
import 'package:frontend_mobile/domain/param/store/get_stores_by_location_params.dart';
import 'package:frontend_mobile/domain/repository/store_repository.dart';

final Provider<GetStoresByLocationUsecase> getStoresByLocationUsecaseProvider =
    Provider<GetStoresByLocationUsecase>((Ref ref) {
      return GetStoresByLocationUsecase(
        repository: ref.read(storeRepositoryProvider),
      );
    });

class GetStoresByLocationUsecase
    implements Usecase<List<StoreByLocationModel>, GetStoresByLocationParams> {
  const GetStoresByLocationUsecase({required StoreRepository repository})
    : _repository = repository;
  final StoreRepository _repository;

  @override
  Future<Result<List<StoreByLocationModel>, CustomException>> call({
    required GetStoresByLocationParams params,
  }) async {
    return await _repository.getStoresByLocation(params: params);
  }
}
