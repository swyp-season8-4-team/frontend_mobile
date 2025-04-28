import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/store_review_repository_impl.dart';
import 'package:frontend_mobile/domain/param/store_review/check_today_review_params.dart';
import 'package:frontend_mobile/domain/repository/store_review_repository.dart';

final Provider<CheckTodayReviewUsecase> checkTodayReviewUsecaseProvider =
    Provider<CheckTodayReviewUsecase>((Ref ref) {
      return CheckTodayReviewUsecase(
        repository: ref.read(storeReviewRepositoryProvider),
      );
    });

class CheckTodayReviewUsecase implements Usecase<bool, CheckTodayReviewParams> {
  const CheckTodayReviewUsecase({required StoreReviewRepository repository})
    : _repository = repository;
  final StoreReviewRepository _repository;

  @override
  Future<Result<bool, CustomException>> call({
    required CheckTodayReviewParams params,
  }) async {
    return await _repository.checkTodayReview(params: params);
  }
}
