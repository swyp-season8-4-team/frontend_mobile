import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/store_review_repository_impl.dart';
import 'package:frontend_mobile/domain/param/store_review/add_store_review_params.dart';
import 'package:frontend_mobile/domain/repository/store_review_repository.dart';

final Provider<AddStoreReviewUsecase> addStoreReviewUsecaseProvider =
    Provider<AddStoreReviewUsecase>((Ref ref) {
      return AddStoreReviewUsecase(
        repository: ref.read(storeReviewRepositoryProvider),
      );
    });

class AddStoreReviewUsecase implements Usecase<void, AddStoreReviewParams> {
  const AddStoreReviewUsecase({required StoreReviewRepository repository})
    : _repository = repository;
  final StoreReviewRepository _repository;

  @override
  Future<Result<void, CustomException>> call({
    required AddStoreReviewParams params,
  }) async {
    return await _repository.addStoreReview(params: params);
  }
}
