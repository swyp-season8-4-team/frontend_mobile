import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/user_coupon_repository_impl.dart';
import 'package:frontend_mobile/domain/param/user_coupon/issue_coupon_params.dart';
import 'package:frontend_mobile/domain/repository/user_coupon_repository.dart';

final Provider<IssueCouponUsecase> issueCouponUsecaseProvider =
    Provider<IssueCouponUsecase>((Ref ref) {
      return IssueCouponUsecase(
        repository: ref.read(userCouponRepositoryProvider),
      );
    });

class IssueCouponUsecase implements Usecase<void, IssueCouponParams> {
  const IssueCouponUsecase({required UserCouponRepository repository})
    : _repository = repository;
  final UserCouponRepository _repository;

  @override
  Future<Result<void, CustomException>> call({
    required IssueCouponParams params,
  }) async {
    return await _repository.issueCoupon(params: params);
  }
}
