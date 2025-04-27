import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/store_review_repository_impl.dart';
import 'package:frontend_mobile/domain/param/store_review/update_store_review_params.dart';
import 'package:frontend_mobile/domain/repository/store_review_repository.dart';

final Provider<UpdateStoreReviewUsecase> updateStoreReviewUsecaseProvider =
    Provider<UpdateStoreReviewUsecase>((Ref ref) {
      return UpdateStoreReviewUsecase(
        repository: ref.read(storeReviewRepositoryProvider),
      );
    });

class UpdateStoreReviewUsecase
    implements Usecase<void, UpdateStoreReviewParams> {
  const UpdateStoreReviewUsecase({required this.repository});
  final StoreReviewRepository repository;

  @override
  Future<Result<void, CustomException>> call({
    required UpdateStoreReviewParams params,
  }) async {
    return await repository.updateStoreReview(params: params);
  }
}
