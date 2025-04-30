import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/params/no_params.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/user_repository_impl.dart';
import 'package:frontend_mobile/domain/model/user/user_review_model.dart';
import 'package:frontend_mobile/domain/repository/user_repository.dart';

final Provider<GetMyReviewsUsecase> getMyReviewsUsecaseProvider =
    Provider<GetMyReviewsUsecase>((Ref ref) {
      return GetMyReviewsUsecase(repository: ref.read(userRepositoryProvider));
    });

class GetMyReviewsUsecase implements Usecase<UserReviewModel, NoParams> {
  const GetMyReviewsUsecase({required this.repository});
  final UserRepository repository;

  @override
  Future<Result<UserReviewModel, CustomException>> call({
    required NoParams params,
  }) async {
    return await repository.getNyReviews(params: params);
  }
}
