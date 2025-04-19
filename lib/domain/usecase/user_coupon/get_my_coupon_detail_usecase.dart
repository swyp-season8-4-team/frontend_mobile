import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/user_coupon_repository_impl.dart';
import 'package:frontend_mobile/domain/model/user_coupon/coupon_detail_model.dart';
import 'package:frontend_mobile/domain/param/user_coupon/get_my_coupon_detail_params.dart';
import 'package:frontend_mobile/domain/repository/user_coupon_repository.dart';

final Provider<GetMyCouponDetailUsecase> getMyCouponDetailUsecaseProvider =
    Provider<GetMyCouponDetailUsecase>((Ref ref) {
      return GetMyCouponDetailUsecase(
        repository: ref.read(userCouponRepositoryProvider),
      );
    });

class GetMyCouponDetailUsecase
    implements Usecase<UserCouponDetailModel, GetMyCouponDetailParams> {
  const GetMyCouponDetailUsecase({required UserCouponRepository repository})
    : _repository = repository;
  final UserCouponRepository _repository;

  @override
  Future<Result<UserCouponDetailModel, CustomException>> call({
    required GetMyCouponDetailParams params,
  }) async {
    return await _repository.getMyCouponDetail(params: params);
  }
}
