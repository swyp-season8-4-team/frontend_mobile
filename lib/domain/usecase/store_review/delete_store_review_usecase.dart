import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/store_review_repository_impl.dart';
import 'package:frontend_mobile/domain/param/store_review/delete_store_review_params.dart';
import 'package:frontend_mobile/domain/repository/store_review_repository.dart';

final Provider<DeleteStoreReviewUsecase> deleteStoreReviewUsecaseProvider =
    Provider<DeleteStoreReviewUsecase>((Ref ref) {
      return DeleteStoreReviewUsecase(
        repository: ref.read(storeReviewRepositoryProvider),
      );
    });

class DeleteStoreReviewUsecase
    implements Usecase<void, DeleteStoreReviewParams> {
  const DeleteStoreReviewUsecase({required StoreReviewRepository repository})
    : _repository = repository;
  final StoreReviewRepository _repository;

  @override
  Future<Result<void, CustomException>> call({
    required DeleteStoreReviewParams params,
  }) async {
    return await _repository.deleteStoreReview(params: params);
  }
}
