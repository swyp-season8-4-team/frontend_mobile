import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/params/no_params.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/user_coupon_repository_impl.dart';
import 'package:frontend_mobile/domain/model/user_coupon/coupon_usage_status_model.dart';
import 'package:frontend_mobile/domain/repository/user_coupon_repository.dart';

final Provider<GetCouponUsageStatusUsecase>
getCouponUsageStatusUsecaseProvider = Provider<GetCouponUsageStatusUsecase>((
  Ref ref,
) {
  return GetCouponUsageStatusUsecase(
    repository: ref.read(userCouponRepositoryProvider),
  );
});

class GetCouponUsageStatusUsecase
    implements Usecase<UserCouponUsageStatusModel, NoParams> {
  const GetCouponUsageStatusUsecase({required UserCouponRepository repository})
    : _repository = repository;
  final UserCouponRepository _repository;

  @override
  Future<Result<UserCouponUsageStatusModel, CustomException>> call({
    required NoParams params,
  }) async {
    return await _repository.getCouponUsageStatus(params: params);
  }
}
