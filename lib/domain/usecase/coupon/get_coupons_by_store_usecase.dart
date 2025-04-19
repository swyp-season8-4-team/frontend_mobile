import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/coupon_repository_impl.dart';
import 'package:frontend_mobile/domain/model/coupon/coupon_model.dart';
import 'package:frontend_mobile/domain/param/coupon/get_coupons_by_store_params.dart';
import 'package:frontend_mobile/domain/repository/coupon_repository.dart';

final Provider<GetCouponsByStoreUsecase> getCouponsByStoreUsecaseProvider =
    Provider<GetCouponsByStoreUsecase>((Ref ref) {
      return GetCouponsByStoreUsecase(
        repository: ref.read(couponRepositoryProvider),
      );
    });

class GetCouponsByStoreUsecase
    implements Usecase<List<CouponModel>, GetCouponsByStoreParams> {
  const GetCouponsByStoreUsecase({required CouponRepository repository})
    : _repository = repository;
  final CouponRepository _repository;

  @override
  Future<Result<List<CouponModel>, CustomException>> call({
    required GetCouponsByStoreParams params,
  }) async {
    return await _repository.getCouponsByStore(params: params);
  }
}
