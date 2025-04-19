import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/api_call.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/data/data_source/remote/coupon_remote_data_source.dart';
import 'package:frontend_mobile/data/entity/coupon/coupon_entity.dart';
import 'package:frontend_mobile/data/mapper/coupon_mapper.dart';
import 'package:frontend_mobile/domain/model/coupon/coupon_model.dart';
import 'package:frontend_mobile/domain/param/coupon/get_coupons_by_store_params.dart';
import 'package:frontend_mobile/domain/repository/coupon_repository.dart';

final Provider<CouponRepository> couponRepositoryProvider =
    Provider<CouponRepository>((Ref ref) {
      return CouponRepositoryImpl(api: ref.read(couponApiProvider));
    });

class CouponRepositoryImpl implements CouponRepository {
  const CouponRepositoryImpl({required CouponRemoteDataSource api})
    : _api = api;
  final CouponRemoteDataSource _api;

  @override
  Future<Result<List<CouponModel>, CustomException>> getCouponsByStore({
    required GetCouponsByStoreParams params,
  }) async {
    return await apiCall(
      api: () async {
        final List<CouponEntity> result = await _api.getCouponsByStore(
          storeUuid: params.storeUuid,
        );
        return result.map((CouponEntity e) => e.toModel()).toList();
      },
    );
  }
}
