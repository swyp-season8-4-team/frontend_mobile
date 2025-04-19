import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/user_coupon_repository_impl.dart';
import 'package:frontend_mobile/domain/model/user_coupon/coupon_issue_status_model.dart';
import 'package:frontend_mobile/domain/param/user_coupon/get_coupon_issue_status_params.dart';
import 'package:frontend_mobile/domain/repository/user_coupon_repository.dart';

final Provider<GetCouponIssueStatusUsecase>
getCouponIssueStatusUsecaseProvider = Provider<GetCouponIssueStatusUsecase>((
  Ref ref,
) {
  return GetCouponIssueStatusUsecase(
    repository: ref.read(userCouponRepositoryProvider),
  );
});

class GetCouponIssueStatusUsecase
    implements
        Usecase<List<UserCouponIssueStatusModel>, GetCouponIssueStatusParams> {
  const GetCouponIssueStatusUsecase({required UserCouponRepository repository})
    : _repository = repository;
  final UserCouponRepository _repository;

  @override
  Future<Result<List<UserCouponIssueStatusModel>, CustomException>> call({
    required GetCouponIssueStatusParams params,
  }) async {
    return await _repository.getCouponIssueStatus(params: params);
  }
}
